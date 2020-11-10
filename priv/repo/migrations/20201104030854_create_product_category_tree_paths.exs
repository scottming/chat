defmodule Chat.Repo.Migrations.CreateProductCategoryTreePaths do
  use Ecto.Migration

  def change do
    create table(:product_category_tree_paths, primary_key: false) do
      add :path_length, :integer, default: 0
      add :ancestor, references(:product_categories, on_delete: :nothing), primary_key: true
      add :descendant, references(:product_categories, on_delete: :nothing), primary_key: true

    end

    create index(:product_category_tree_paths, [:ancestor])
    create index(:product_category_tree_paths, [:descendant])
  end
end
