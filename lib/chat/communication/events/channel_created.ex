defmodule Chat.Communication.Events.ChannelCreated do
  @derive Jason.Encoder
  defstruct [:channel_uuid, :name, :owner_uuid, :channel_user_uuids]
end
