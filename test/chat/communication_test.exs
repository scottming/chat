defmodule Chat.CommunicationTest do
  use Chat.DataCase

  alias Chat.Communication

  describe "create channel" do
    @tag :integration
    test "should failed with not valid data" do
      user_uuid = UUID.uuid4()

      assert {:error, :command_validation_failure, %{owner_uuid: ^user_uuid}, errors} =
               Communication.create_channel(build(:create_channel, owner_uuid: user_uuid))

      assert ["owner_not_found"] = errors
    end

    setup [:register_user]

    @tag :integration
    test "should succeed with valid data", %{user: %{uuid: user_uuid}} do

      # assert the owner the room users
      assert {:ok, %{owner_uuid: ^user_uuid, users: [%{uuid: ^user_uuid}]}} =
               Communication.create_channel(build(:create_channel, owner_uuid: user_uuid))
    end
  end

  describe "join channel" do
    setup [:register_user]

    @tag :integration
    test "should succeed with valid data", %{user: user} do
      assert %{} = user
    end

    @tag :integration
    test "should fail with invalid data", %{user: user} do
      assert %{} = user
    end
  end
end
