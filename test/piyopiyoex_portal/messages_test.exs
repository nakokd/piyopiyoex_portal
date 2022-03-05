defmodule PiyopiyoexPortal.MessagesTest do
  use PiyopiyoexPortal.DataCase

  alias PiyopiyoexPortal.Messages

  describe "messages" do
    alias PiyopiyoexPortal.Messages.Message

    import PiyopiyoexPortal.MessagesFixtures

    @invalid_attrs %{deleted_at: nil, display_name: nil, message: nil}

    test "list_messages/0 returns all messages" do
      message = message_fixture()
      assert Messages.list_messages() == [message]
    end

    test "get_message!/1 returns the message with given id" do
      message = message_fixture()
      assert Messages.get_message!(message.id) == message
    end

    test "create_message/1 with valid data creates a message" do
      valid_attrs = %{deleted_at: ~N[2022-03-04 05:12:00], display_name: "some display_name", message: "some message"}

      assert {:ok, %Message{} = message} = Messages.create_message(valid_attrs)
      assert message.deleted_at == ~N[2022-03-04 05:12:00]
      assert message.display_name == "some display_name"
      assert message.message == "some message"
    end

    test "create_message/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Messages.create_message(@invalid_attrs)
    end

    test "update_message/2 with valid data updates the message" do
      message = message_fixture()
      update_attrs = %{deleted_at: ~N[2022-03-05 05:12:00], display_name: "some updated display_name", message: "some updated message"}

      assert {:ok, %Message{} = message} = Messages.update_message(message, update_attrs)
      assert message.deleted_at == ~N[2022-03-05 05:12:00]
      assert message.display_name == "some updated display_name"
      assert message.message == "some updated message"
    end

    test "update_message/2 with invalid data returns error changeset" do
      message = message_fixture()
      assert {:error, %Ecto.Changeset{}} = Messages.update_message(message, @invalid_attrs)
      assert message == Messages.get_message!(message.id)
    end

    test "delete_message/1 deletes the message" do
      message = message_fixture()
      assert {:ok, %Message{}} = Messages.delete_message(message)
      assert_raise Ecto.NoResultsError, fn -> Messages.get_message!(message.id) end
    end

    test "change_message/1 returns a message changeset" do
      message = message_fixture()
      assert %Ecto.Changeset{} = Messages.change_message(message)
    end
  end
end
