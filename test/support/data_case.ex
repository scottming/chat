defmodule Chat.DataCase do
  use ExUnit.CaseTemplate

  using do
    quote do
      alias Chat.Repo

      import Ecto
      import Ecto.Changeset
      import Ecto.Query
      import Chat.Factory
      import Chat.Fixture
      import Chat.DataCase
    end
  end

  setup do
    Chat.Storage.reset!()
    :ok
  end
end
