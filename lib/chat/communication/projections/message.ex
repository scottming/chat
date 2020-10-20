defmodule Chat.Communication.Projections.Message do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:uuid, :binary_id, autogenerate: false}

  schema "messages" do
    field :content, :string
    field :type, :string
    field :room_uuid, :binary_id
    field :user_uuid, :binary_id

    timestamps()
  end

  @doc false
  def changeset(message, attrs) do
    message
    |> cast(attrs, [:content, :type])
    |> validate_required([:content, :type])
  end
end
