{:ok, _} = Application.ensure_all_started(:ex_machina)
ExUnit.configure(exclude: [:pending])
ExUnit.start()
# Ecto.Adapters.SQL.Sandbox.mode(Chat.Repo, :manual)
