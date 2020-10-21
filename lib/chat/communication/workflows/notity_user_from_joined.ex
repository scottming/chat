defmodule Chat.Communication.Workflows.NotifyUserFromJoined do
  use Commanded.Event.Handler,
    application: Chat.App,
    name: "Communication.Workflows.NotifyUserFromJoined",
    consistency: :eventual
  alias Chat.Communication
  alias Chat.Communication.Events.ChannelJoined

  def handle(%ChannelJoined{channel_uuid: channel_uuid, user_uuid: user_uuid}, _metadata) do
    attrs = %{room_uuid: channel_uuid, user_uuid: user_uuid, content: "#{user_uuid} joined room"}
    :ok = Communication.notify_users(attrs)
    :ok
  end
end
