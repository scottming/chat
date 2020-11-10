defmodule Chat.ProductCatalog.ProductCategory do
  use Ecto.Schema
  import Ecto.Changeset

  schema "product_categories" do
    field :name, :string
    field :user_id, Ecto.UUID

    timestamps()
  end

  @doc false
  def changeset(product_category, attrs) do
    product_category
    |> cast(attrs, [:name, :user_id])
    |> validate_required([:name, :user_id])
  end
end
