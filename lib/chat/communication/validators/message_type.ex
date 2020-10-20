defmodule Chat.Communication.Validators.MessageType do
  def validate(type)  do
    types = ["g", "p"]
    case type in types do
      true -> :ok
      false -> {:error, "type must in #{inspect(types)}"}
    end
  end
end
