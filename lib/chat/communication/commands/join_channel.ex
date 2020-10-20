defmodule Chat.Communication.Commands.JoinChannel do
  defstruct channel_uuid: "", user_uuid: ""

  use ExConstructor

  import Chat.CommonValidators.UUID, only: [uuid_regex: 0]
  alias Chat.Communication.Validators.ExistentChannel

  def valid?(command) do
    Skooma.valid?(Map.from_struct(command), schema())
  end

  defp schema() do
    %{
      channel_uuid: [:string, Skooma.Validators.regex(uuid_regex()), & ExistentChannel.validate(&1)],
      user_uuid: [:string, Skooma.Validators.regex(uuid_regex())]
    }
  end
end
