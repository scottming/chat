defmodule Chat.Communication.Events.ChannelJoined do
  @derive Jason.Encoder
  defstruct [:channel_uuid, :user_uuid]
end
