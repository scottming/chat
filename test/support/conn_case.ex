defmodule ChatWeb.ConnCase do
  @moduledoc """
  This module defines the test case to be used by
  tests that require setting up a connection.

  Such tests rely on `Phoenix.ConnTest` and also
  import other functionality to make it easier
  to build common datastructures and query the data layer.
  """

  use ExUnit.CaseTemplate

  using do
    quote do
      # Import conveniences for testing with connections
      import Plug.Conn
      import Phoenix.ConnTest

      import ChatWeb.Router.Helpers
      import Chat.Factory
      import Chat.Fixture

      # The default endpoint for testing
      @endpoint ChatWeb.Endpoint
    end
  end

  setup _tags do
    Chat.Storage.reset!()
    {:ok, conn: Phoenix.ConnTest.build_conn()}
  end
end
