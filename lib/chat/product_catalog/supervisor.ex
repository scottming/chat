defmodule Chat.ProductCatalog.Supervisor do
  use Supervisor

  alias Chat.ProductCatalog

  def start_link(arg) do
    Supervisor.start_link(__MODULE__, arg, name: __MODULE__)
  end

  def init(_arg) do
    Supervisor.init(
      [ProductCatalog.ProductCategoryCte],
      strategy: :one_for_one
    )
  end
end
