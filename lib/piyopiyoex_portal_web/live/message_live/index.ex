defmodule PiyopiyoexPortalWeb.MessageLive.Index do
  use PiyopiyoexPortalWeb, :live_view

  alias PiyopiyoexPortal.Messages
  alias PiyopiyoexPortal.Messages.Message

  @impl true
  def mount(params, _session, socket) do
    {:ok, assign(socket, :messages, list_messages(params))}
  end

  @impl true
  def handle_params(params, _url, socket) do
    {:noreply, apply_action(socket, socket.assigns.live_action, params)}
  end

  defp apply_action(socket, :new, _params) do
    socket
    |> assign(:page_title, "感想投稿")
    |> assign(:message, %Message{})
  end

  defp apply_action(socket, :index, _params) do
    socket
    |> assign(:message, nil)
  end

  @impl true
  def handle_event("delete", %{"id" => id}, socket) do
    message = Messages.get_message!(id)
    {:ok, _} = Messages.delete_message(message)

    {:noreply, assign(socket, :messages, list_messages())}
  end

  defp list_messages(%{"mode" => mode}) do
    Messages.list_messages(mode)
  end
  defp list_messages(_ \\ %{}) do
    Messages.list_messages()
  end
end
