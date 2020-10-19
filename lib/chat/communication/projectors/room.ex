defmodule Chat.Communication.Projectors.Room do
  use Commanded.Projections.Ecto,
    application: Chat.App,
    name: "Communication.Projectors.User",
    consistency: :strong

  alias Chat.Communication.Events.ChannelCreated
  alias Chat.Communication.Projections.Room

  project(%ChannelCreated{} = channel_created, fn multi ->
    Ecto.Multi.insert(multi, :room, %Room{
      uuid: channel_created.channel_uuid,
      name: channel_created.name,
      type: "c",
      owner_uuid: channel_created.owner_uuid
    })
  end)
end
