defmodule Chat.Accounts.Validators.UniqueUsername do
  use Vex.Validator

  alias Chat.Accounts
  alias Chat.Accounts.Projection.User

  def validate(value, context) do
    user_uuid = Map.get(context, :user_uuid)

    case username_registered?(value, user_uuid) do
      true -> {:error, "has already been taken"}
      false -> :ok
    end
  end

  def username_registered?(username, user_uuid) do
    case Accounts.get_user_by(username: username) do
      %User{uuid: ^user_uuid} -> false
      nil -> false
      _ -> true
    end
  end
end
