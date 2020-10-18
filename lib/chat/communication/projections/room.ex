defmodule Chat.Communication.Projections.Room do
  use Ecto.Schema
  import Ecto.Changeset

  schema "rooms" do
    field :name, :string
    field :type, :string
    field :owner_id, :id

    timestamps()
  end

  @doc false
  def changeset(room, attrs) do
    room
    |> cast(attrs, [:name, :type])
    |> validate_required([:name, :type])
  end
end
