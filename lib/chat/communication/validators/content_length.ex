defmodule Chat.Communication.Validators.ContentLength do
  def validate(nil) do
    {:error, "content can not be nil"}
  end

  def validate(content) when is_binary(content) do
    case String.length(content) > 1 and String.length(content) <= 150 do
      true -> :ok
      false -> {:error, "content length must be in #{inspect([1..150])}"}
    end
  end
end
