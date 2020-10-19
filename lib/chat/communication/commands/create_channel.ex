defmodule Chat.Communication.Commands.CreateChannel do
  defstruct channel_uuid: "", name: "", owner_uuid: "", channel_user_uuids: ""

  use ExConstructor

  alias __MODULE__

  import Chat.CommonValidators.UUID, only: [uuid_regex: 0]
  alias Chat.Communication.Validators.UniqueChannelName

  def valid?(command) do
    Skooma.valid?(Map.from_struct(command), schema())
  end

  defp schema() do
    %{
      channel_uuid: [:string, Skooma.Validators.regex(uuid_regex())],
      name: [:string, &UniqueChannelName.validate(&1)],
      owner_uuid: [:string, Skooma.Validators.regex(uuid_regex())]
    }
  end

  def assign_uuid(%CreateChannel{} = create_channel, uuid) do
    %{create_channel | channel_uuid: uuid}
  end
end
