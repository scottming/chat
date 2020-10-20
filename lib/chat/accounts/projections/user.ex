defmodule Chat.Accounts.Projections.User do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:uuid, :binary_id, autogenerate: false}
  @timestamps_opts [type: :utc_datetime_usec]

  schema "accounts_users" do
    field :email, :string
    field :hashed_password, :string
    field :username, :string

    many_to_many :rooms, Chat.Communication.Projections.Room,
      join_through: "rooms_users",
      join_keys: [user_uuid: :uuid, room_uuid: :uuid]

    timestamps()
  end

  @doc false
  def changeset(user, attrs) do
    user
    |> cast(attrs, [:username, :email, :hashed_password, :uuid])
    |> validate_required([:username, :email, :hashed_password, :uuid])
  end
end
