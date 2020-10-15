# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :chat,
  ecto_repos: [Chat.Repo],
  event_stores: [Chat.EventStore]

config :chat, Chat.App,
  event_store: [
    adapter: Commanded.EventStore.Adapters.EventStore,
    event_store: Chat.EventStore
  ],
  pub_sub: :local,
  registry: :local

config :commanded, event_store: Commanded.EventStore.Adapters.EventStore

config :commanded_ecto_projections, repo: Chat.Repo

config :vex, sources: [Chat.Accounts.Validators, Vex.Validators, Chat.Support.Validators]

# Configures the endpoint
config :chat, ChatWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "9kN6Ai328uIcE9HltZDcmcPXIHLob38hmxKXIDgiGR+NAc2JxvkkAMlkgb3Dsje4",
  render_errors: [view: ChatWeb.ErrorView, accepts: ~w(html json), layout: false],
  pubsub_server: Chat.PubSub,
  live_view: [signing_salt: "p5VJxuTs"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
