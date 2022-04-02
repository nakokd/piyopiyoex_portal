defmodule PiyopiyoexPortalWeb.MessageLiveTest do
  use PiyopiyoexPortalWeb.ConnCase

  import Phoenix.LiveViewTest
  import PiyopiyoexPortal.MessagesFixtures

  @create_attrs %{
    display_name: "some display_name",
    message: "some message"
  }
  @invalid_attrs %{
    display_name: nil,
    message: nil
  }

  defp create_message(_) do
    message = message_fixture()
    %{message: message}
  end

  describe "Index" do
    setup [:create_message]

    test "lists all messages", %{conn: conn, message: message} do
      {:ok, _index_live, html} = live(conn, Routes.message_index_path(conn, :index))

      assert html =~ "Listing Messages"
      assert html =~ message.display_name
    end

    test "saves new message", %{conn: conn} do
      {:ok, index_live, _html} = live(conn, Routes.message_index_path(conn, :index))

      assert index_live |> element("a", "New Message") |> render_click() =~
               "New Message"

      assert_patch(index_live, Routes.message_index_path(conn, :new))

      assert index_live
             |> form("#message-form", message: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      {:ok, _, html} =
        index_live
        |> form("#message-form", message: @create_attrs)
        |> render_submit()
        |> follow_redirect(conn, Routes.message_index_path(conn, :index))

      assert html =~ "Message created successfully"
      assert html =~ "some display_name"
    end
  end
end
