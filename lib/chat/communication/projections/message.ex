defmodule Chat.Communication.Projections.Message do
  use Ecto.Schema
  import Ecto.Changeset

  schema "messages" do
    field :content, :string
    field :type, :string
    field :room_id, :id
    field :user_id, :id

    timestamps()
  end

  @doc false
  def changeset(message, attrs) do
    message
    |> cast(attrs, [:content, :type])
    |> validate_required([:content, :type])
  end
end
