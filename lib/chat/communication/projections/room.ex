defmodule Chat.Communication.Projections.Room do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:uuid, :binary_id, autogenerate: false}

  schema "rooms" do
    field :name, :string
    field :type, :string
    field :owner_uuid, :binary_id

    many_to_many :users, Chat.Accounts.Projections.User,
      join_through: "rooms_users",
      join_keys: [room_uuid: :uuid, user_uuid: :uuid]

    timestamps()
  end

  @doc false
  def changeset(room, attrs) do
    room
    |> cast(attrs, [:name, :type])
    |> validate_required([:name, :type])
  end
end
