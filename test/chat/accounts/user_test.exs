defmodule Chat.Accounts.Aggregates.UserTest do
  use Chat.AggregateCase, aggregate: Chat.Accounts.Aggregates.User

  alias Chat.Accounts.Events.UserRegistered

  describe("register user") do
    @tag :unit
    test "should succeed when valid" do
      user_uuid = UUID.uuid4()

      assert_events(
        build(:register_user, user_uuid: user_uuid),
        [
          %UserRegistered{
            user_uuid: user_uuid
          }
        ]
      )
    end
  end
end
