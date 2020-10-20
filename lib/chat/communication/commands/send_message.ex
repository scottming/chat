defmodule Chat.Communication.Commands.SendMessage do
  defstruct message_uuid: "", room_uuid: "", content: "", type: "", user_uuid: ""

  use ExConstructor
  import Chat.CommonValidators.UUID, only: [uuid_regex: 0]
  alias Chat.Communication.Validators.ContentLength
  alias Chat.Communication.Validators.MessageType

  def valid?(command) do
    Skooma.valid?(Map.from_struct(command), schema())
  end

  defp schema() do
    %{room_uuid: [:string, Skooma.Validators.regex(uuid_regex())],
      content: [:string, &ContentLength.validate(&1)],
      user_uuid: [:string],
      type: [:string, &MessageType.validate(&1)]
    }
  end
end
