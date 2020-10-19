defmodule Chat.Communication.Aggregates.Room do
  defstruct [:uuid, :name, :type, :owner_uuid, :channel_user_uuids]

  alias __MODULE__

  alias Chat.Communication.Commands.{
    CreateChannel,
    JoinChannel,
    CreateDirectChat,
    NotifyRoomUsers
  }

  alias Chat.Communication.Events.{
    ChannelCreated,
    ChannelJoined,
    DirectChatCreated,
    RoomUsersNotified
  }

  def execute(%Room{uuid: nil}, %CreateChannel{} = create_channel) do
    %ChannelCreated{
      channel_uuid: create_channel.channel_uuid,
      name: create_channel.name,
      owner_uuid: create_channel.owner_uuid,
      channel_user_uuids: create_channel.channel_user_uuids
    }
  end

  def apply(%Room{uuid: nil}, %ChannelCreated{} = channel_created) do
    %Room{
      uuid: channel_created.channel_uuid,
      name: channel_created.name,
      type: "c",
      owner_uuid: channel_created.owner_uuid,
      channel_user_uuids: channel_created.channel_user_uuids
    }
  end
end
