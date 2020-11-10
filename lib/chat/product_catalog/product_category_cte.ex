defmodule Chat.ProductCatalog.ProductCategoryCte do
  use CTE,
    otp_app: :cte,
    adapter: CTE.Adapter.Ecto,
    repo: Chat.Repo,
    nodes: Chat.ProductCatalog.ProductCategory,
    paths: Chat.ProductCatalog.ProductCategoryTreePath
end
