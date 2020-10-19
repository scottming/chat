defmodule Chat.Accounts.Validators.UniqueUsername do
  alias Chat.Accounts
  alias Chat.Accounts.Projection.User

  def validate(value) do
    case username_registered?(value) do
      true -> {:error, "has already been taken"}
      false -> :ok
    end
  end

  defp username_registered?(value) do
    case Accounts.get_user_by(username: value) do
      %User{} -> true
      _ -> false
    end
  end
end
