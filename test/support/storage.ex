defmodule Chat.Storage do
  @doc """
  Reset the event store and read store databases.
  """
  def reset! do
    :ok = Application.stop(:chat)
    reset_eventstore!()
    reset_readstore!()

    {:ok, _} = Application.ensure_all_started(:chat)
  end

  defp reset_eventstore! do
    {:ok, conn} =
      Chat.EventStore.config()
      |> EventStore.Config.default_postgrex_opts()
      |> Postgrex.start_link()

    EventStore.Storage.Initializer.reset!(conn)
  end

  defp reset_readstore! do
    {:ok, conn} = Postgrex.start_link(Chat.Repo.config())

    Postgrex.query!(conn, truncate_readstore_tables(), [])
  end

  defp truncate_readstore_tables do
    """
    TRUNCATE TABLE
      accounts_users,
      rooms,
      rooms_users,
      messages,
      projection_versions
    RESTART IDENTITY;
    """
  end
end
