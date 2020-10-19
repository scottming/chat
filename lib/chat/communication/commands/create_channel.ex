defmodule Chat.Communication.Commands.CreateChannel do
  defstruct channel_uuid: "", name: "", owner_uuid: "", channel_user_uuids: ""

  use ExConstructor

  alias __MODULE__
  alias Chat.Communication.Validators.UniqueChannelName

  def valid?(command) do
    Skooma.valid?(Map.from_struct(command), schema)
  end

  defp schema() do
    %{}
  end

  def assign_uuid(%CreateChannel{} = create_channel, uuid) do
    %{create_channel | channel_uuid: uuid}
  end
end
