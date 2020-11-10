defmodule Chat.ProductCatalog.ProductCategoryTreePath do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key false

  schema "product_category_tree_paths" do
    field :path_length, :integer, default: 0
    field :ancestor, :id, primary_key: true
    field :descendant, :id, primary_key: true
  end

  @doc false
  def changeset(product_category_tree_path, attrs) do
    product_category_tree_path
    |> cast(attrs, [:path_length])
    |> validate_required([:path_length])
  end
end
