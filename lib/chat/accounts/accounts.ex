defmodule Chat.Accounts do
  @moduledoc """
  The Accounts context.
  """

  import Ecto.Query, warn: false

  alias Chat.Accounts.Projections.User
  alias Chat.Accounts.Commands.RegisterUser

  alias Chat.Repo
  alias Chat.App

  def get_user_by(condition) do
    Repo.get_by(User, condition)
  end

  def list_users(args) when is_map(args) do
    Enum.reduce(args, User, fn
      {:user_uuids, user_uuids}, query ->
        from q in query, where: q.uuid in ^user_uuids
    end)
  end

  def register_user(attrs) do
    uuid = UUID.uuid4()

    register_user =
      attrs
      |> RegisterUser.new()
      |> RegisterUser.assign_uuid(uuid)
      |> RegisterUser.downcase_username()

    with :ok <- App.dispatch(register_user, consistency: :strong) do
      get(User, uuid)
    end
  end

  defp get(schema, uuid) do
    case Repo.get(schema, uuid) do
      nil -> {:error, :not_found}
      projection -> {:ok, projection}
    end
  end
end
