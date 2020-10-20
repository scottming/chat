defmodule Chat.Communication.Projections.RoomUser do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key false

  schema "rooms_users" do
    field :role, :string
    field :room_uuid, :binary_id, primary_key: true
    field :user_uuid, :binary_id, primary_key: true

    timestamps()
  end

  @doc false
  def changeset(room_user, attrs) do
    room_user
    |> cast(attrs, [:role])
    |> validate_required([:role])
  end
end
