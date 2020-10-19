defmodule Chat.Accounts.Aggregates.RoomTest do
  use Chat.AggregateCase, aggregate: Chat.Communication.Aggregates.Room

  alias Chat.Communication.Events.ChannelCreated

  describe("create channel") do
    @tag :unit
    test "should failed when not valid" do
      user_uuid = UUID.uuid4()
      channel_uuid = UUID.uuid4()

      assert_events(
        build(:create_channel, owner_uuid: user_uuid, channel_uuid: channel_uuid),
        [
          %ChannelCreated{
            owner_uuid: user_uuid
          }
        ]
      )
    end
  end
end
