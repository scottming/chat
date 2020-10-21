defmodule ChatWeb.RoomChannel do
  use ChatWeb, :channel

  alias Chat.Communication

  @impl true
  def join("room:" <> uuid, payload, socket) do
    attrs = %{user_uuid: Map.get(payload, "user_uuid"), channel_uuid: uuid}
    {:ok, _room} = Communication.join_channel(attrs)
    {:ok, socket}
  end
end
