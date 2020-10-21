defmodule Chat.Communication.Aggregates.Room do
  defstruct [:uuid, :name, :type, :owner_uuid, :user_uuids, :message_uuids]

  alias __MODULE__

  alias Chat.Communication.Commands.{
    CreateChannel,
    JoinChannel,
    NotityUsers,
    SendMessage
  }

  alias Chat.Communication.Events.{
    ChannelCreated,
    ChannelJoined,
    MessageSended,
    UsersNotified
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

  def execute(%Room{} = _room, %SendMessage{} = send_message) do
    %MessageSended{
      message_uuid: send_message.message_uuid,
      room_uuid: send_message.room_uuid,
      content: send_message.content,
      user_uuid: send_message.user_uuid,
      type: send_message.type
    }
  end

  def execute(%Room{} = _room, %NotityUsers{} = notify_users) do
    %UsersNotified{
      content: notify_users.content,
      room_uuid: notify_users.room_uuid,
      user_uuids: notify_users.user_uuids
    }
  end

  def apply(%Room{} = room, %ChannelCreated{} = channel_created) do
    %Room{
      room
      | uuid: channel_created.channel_uuid,
        name: channel_created.name,
        type: "c",
        owner_uuid: channel_created.owner_uuid,
        user_uuids: channel_created.channel_user_uuids,
        message_uuids: []
    }
  end

  def apply(%Room{} = room, %ChannelJoined{} = channel_joined) do
    %Room{
      room
      | user_uuids: [channel_joined.user_uuid | room.user_uuids]
    }
  end

  def apply(%Room{} = room, %MessageSended{} = message) do
    %Room{
      room
      | message_uuids: [message.message_uuid | room.message_uuids]
    }
  end

  def apply(%Room{} = room, %UsersNotified{} = _ ) do
    room
  end
end
