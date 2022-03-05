defmodule PiyopiyoexPortal.MessagesFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `PiyopiyoexPortal.Messages` context.
  """

  @doc """
  Generate a message.
  """
  def message_fixture(attrs \\ %{}) do
    {:ok, message} =
      attrs
      |> Enum.into(%{
        deleted_at: ~N[2022-03-04 05:12:00],
        display_name: "some display_name",
        message: "some message"
      })
      |> PiyopiyoexPortal.Messages.create_message()

    message
  end
end
