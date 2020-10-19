defmodule Chat.Communication.Events.ChannelCreated do
  @derive Jason.Encoder
  defstruct [:channel_uuid, :name, :channel_users]
end
