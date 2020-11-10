defmodule Chat.ProductCatalogTest do
  use Chat.DataCase

  alias Chat.ProductCatalog

  describe "product_categories" do
    alias Chat.ProductCatalog.ProductCategory

    @valid_attrs %{name: "some name", user_id: "7488a646-e31f-11e4-aace-600308960662"}
    @update_attrs %{name: "some updated name", user_id: "7488a646-e31f-11e4-aace-600308960668"}
    @invalid_attrs %{name: nil, user_id: nil}

    def product_category_fixture(attrs \\ %{}) do
      {:ok, product_category} =
        attrs
        |> Enum.into(@valid_attrs)
        |> ProductCatalog.create_product_category()

      product_category
    end

    test "list_product_categories/0 returns all product_categories" do
      product_category = product_category_fixture()
      assert ProductCatalog.list_product_categories() == [product_category]
    end

    test "get_product_category!/1 returns the product_category with given id" do
      product_category = product_category_fixture()
      assert ProductCatalog.get_product_category!(product_category.id) == product_category
    end

    test "create_product_category/1 with valid data creates a product_category" do
      assert {:ok, %ProductCategory{} = product_category} = ProductCatalog.create_product_category(@valid_attrs)
      assert product_category.name == "some name"
      assert product_category.user_id == "7488a646-e31f-11e4-aace-600308960662"
    end

    test "create_product_category/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = ProductCatalog.create_product_category(@invalid_attrs)
    end

    test "update_product_category/2 with valid data updates the product_category" do
      product_category = product_category_fixture()
      assert {:ok, %ProductCategory{} = product_category} = ProductCatalog.update_product_category(product_category, @update_attrs)
      assert product_category.name == "some updated name"
      assert product_category.user_id == "7488a646-e31f-11e4-aace-600308960668"
    end

    test "update_product_category/2 with invalid data returns error changeset" do
      product_category = product_category_fixture()
      assert {:error, %Ecto.Changeset{}} = ProductCatalog.update_product_category(product_category, @invalid_attrs)
      assert product_category == ProductCatalog.get_product_category!(product_category.id)
    end

    test "delete_product_category/1 deletes the product_category" do
      product_category = product_category_fixture()
      assert {:ok, %ProductCategory{}} = ProductCatalog.delete_product_category(product_category)
      assert_raise Ecto.NoResultsError, fn -> ProductCatalog.get_product_category!(product_category.id) end
    end

    test "change_product_category/1 returns a product_category changeset" do
      product_category = product_category_fixture()
      assert %Ecto.Changeset{} = ProductCatalog.change_product_category(product_category)
    end
  end

  describe "product_category_tree_paths" do
    alias Chat.ProductCatalog.ProductCategoryTreePath

    @valid_attrs %{path_length: 42}
    @update_attrs %{path_length: 43}
    @invalid_attrs %{path_length: nil}

    def product_category_tree_path_fixture(attrs \\ %{}) do
      {:ok, product_category_tree_path} =
        attrs
        |> Enum.into(@valid_attrs)
        |> ProductCatalog.create_product_category_tree_path()

      product_category_tree_path
    end

    test "list_product_category_tree_paths/0 returns all product_category_tree_paths" do
      product_category_tree_path = product_category_tree_path_fixture()
      assert ProductCatalog.list_product_category_tree_paths() == [product_category_tree_path]
    end

    test "get_product_category_tree_path!/1 returns the product_category_tree_path with given id" do
      product_category_tree_path = product_category_tree_path_fixture()
      assert ProductCatalog.get_product_category_tree_path!(product_category_tree_path.id) == product_category_tree_path
    end

    test "create_product_category_tree_path/1 with valid data creates a product_category_tree_path" do
      assert {:ok, %ProductCategoryTreePath{} = product_category_tree_path} = ProductCatalog.create_product_category_tree_path(@valid_attrs)
      assert product_category_tree_path.path_length == 42
    end

    test "create_product_category_tree_path/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = ProductCatalog.create_product_category_tree_path(@invalid_attrs)
    end

    test "update_product_category_tree_path/2 with valid data updates the product_category_tree_path" do
      product_category_tree_path = product_category_tree_path_fixture()
      assert {:ok, %ProductCategoryTreePath{} = product_category_tree_path} = ProductCatalog.update_product_category_tree_path(product_category_tree_path, @update_attrs)
      assert product_category_tree_path.path_length == 43
    end

    test "update_product_category_tree_path/2 with invalid data returns error changeset" do
      product_category_tree_path = product_category_tree_path_fixture()
      assert {:error, %Ecto.Changeset{}} = ProductCatalog.update_product_category_tree_path(product_category_tree_path, @invalid_attrs)
      assert product_category_tree_path == ProductCatalog.get_product_category_tree_path!(product_category_tree_path.id)
    end

    test "delete_product_category_tree_path/1 deletes the product_category_tree_path" do
      product_category_tree_path = product_category_tree_path_fixture()
      assert {:ok, %ProductCategoryTreePath{}} = ProductCatalog.delete_product_category_tree_path(product_category_tree_path)
      assert_raise Ecto.NoResultsError, fn -> ProductCatalog.get_product_category_tree_path!(product_category_tree_path.id) end
    end

    test "change_product_category_tree_path/1 returns a product_category_tree_path changeset" do
      product_category_tree_path = product_category_tree_path_fixture()
      assert %Ecto.Changeset{} = ProductCatalog.change_product_category_tree_path(product_category_tree_path)
    end
  end
end
