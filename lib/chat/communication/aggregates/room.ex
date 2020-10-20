defmodule Chat.Communication.Aggregates.Room do
  defstruct [:uuid, :name, :type, :owner_uuid, :room_user_uuids]

  alias __MODULE__

  alias Chat.Communication.Commands.{
    CreateChannel,
    JoinChannel,
    NotifyRoomUsers
  }

  alias Chat.Communication.Events.{
    ChannelCreated,
    ChannelJoined,
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

  def execute(%Room{} = _room, %JoinChannel{} = join_channel) do
    %ChannelJoined{channel_uuid: join_channel.channel_uuid, user_uuid: join_channel.user_uuid}
  end

  def apply(%Room{} = room, %ChannelCreated{} = channel_created) do
    %Room{
      room
      | uuid: channel_created.channel_uuid,
        name: channel_created.name,
        type: "c",
        owner_uuid: channel_created.owner_uuid,
        room_user_uuids: channel_created.channel_user_uuids
    }
  end

  def apply(%Room{} = room, %ChannelJoined{} = channel_joined) do
    %Room{
      room
      | room_user_uuids: [channel_joined.user_uuid | room.room_user_uuids]
    }
  end
end
