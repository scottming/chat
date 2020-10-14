defmodule Chat.Accounts.Validators.UniqueUsername do

  alias Chat.Accounts
  alias Chat.Accounts.Projection.User

  def validate(value, context) do
    user_uuid = Map.get(context, :user_uuid)

    case email_registered?(value, user_uuid) do
      true -> {:error, "has already been taken"}
      false -> :ok
    end
  end

  def email_registered?(email, user_uuid) do
    case Accounts.get_user_by!(email) do
      %User{uuid: ^user_uuid} -> false
      nil -> false
      _ -> true
    end
  end

end
