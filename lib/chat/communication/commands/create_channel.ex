defmodule Chat.Communication.Commands.CreateChannel do
  defstruct channel_uuid: "", name: "", owner_uuid: "", channel_user_uuids: ""

  use ExConstructor
  use Vex.Struct

  alias __MODULE__
  alias Chat.Communication.Validators.UniqueChannelName
  # alias Chat.Communication.Validators.ExistentUsers

  validates(:channel_uuid, uuid: true)
  validates(:name, string: true, by: &UniqueChannelName.validate/2)
  validates(:channel_users, list: true, by: &ExistentUsers.validate/2)
  validates(:owner_uuid, uuid: true)

  def assign_uuid(%CreateChannel{} = create_channel, uuid) do
    %{create_channel | channel_uuid: uuid}
  end
end
