defmodule Chat.Communication.Validators.ExistentUsers do
  alias Chat.Accounts

  def validate(owner_uuid) do
    case Accounts.get_user_by(uuid: owner_uuid) do
      %Accounts.Projections.User{} -> :ok
      _ -> {:error, "owner_not_found"}
    end
  end
end
