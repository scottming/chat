defmodule Chat.CommunicationTest do
  use Chat.DataCase

  alias Chat.Communication
  alias Chat.Communication.Projections.Room

  describe "create channel" do
    setup [:register_user]

    @tag :integration
    test "should failed with not valid data", %{user: _exist_user} do
      user_uuid = UUID.uuid4()

      assert {:error, :command_validation_failure, %{owner_uuid: user_uuid}, errors} =
               Communication.create_channel(build(:create_channel, owner_uuid: user_uuid)) |> IO.inspect(label: "fuck")

      assert ["owner_not_found"] = errors
    end

    @tag :integration
    test "should succeed with valid data", %{user: user} do
      assert %{uuid: uuid} = user |> IO.inspect(label: "fuck2")
    end
  end
end
