defmodule Chat.Communication.Projections.RoomUser do
  use Ecto.Schema
  import Ecto.Changeset

  schema "room_users" do
    field :role, :string
    field :room_id, :id
    field :user_id, :id

    timestamps()
  end

  @doc false
  def changeset(room_user, attrs) do
    room_user
    |> cast(attrs, [:role])
    |> validate_required([:role])
  end
end
