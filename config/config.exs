use Mix.Config

# General application configuration
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

# Configures the endpoint
config :chat, ChatWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "hXslnxxJrzfI918PrmgkZZwJU3GYhT8y1500AP6Foxq9aDgjChbi0BcMdsscFkAs",
  render_errors: [view: ChatWeb.ErrorView, accepts: ~w(json)],
  pubsub_server: Chat.PubSub

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

config :commanded,
  event_store_adapter: Commanded.EventStore.Adapters.EventStore

config :commanded_ecto_projections,
  repo: Chat.Repo

config :phoenix, :json_library, Jason

config :chat, Chat.Auth.Guardian,
  allowed_algos: ["HS512"],
  verify_module: Guardian.JWT,
  issuer: "Chat",
  ttl: {30, :days},
  allowed_drift: 2000,
  verify_issuer: true,
  secret_key: "IOjbrty1eMEBzc5aczQn0FR4Gd8P9IF1cC7tqwB7ThV/uKjS5mrResG1Y0lCzTNJ"

import_config "#{Mix.env()}.exs"
