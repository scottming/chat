use Mix.Config

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :chat, ChatWeb.Endpoint,
  http: [port: 4001],
  server: false

# Print only warnings and errors during test
config :logger, level: :warn
# config :logger, :console, format: "[$level] $message\n"

# Configures the event store database
config :chat, Chat.EventStore,
  serializer: Commanded.Serialization.JsonSerializer,
  username: System.get_env("USER"),
  password: "",
  database: "chat_eventstore_test",
  hostname: "localhost",
  pool_size: 1

# Configures the read store database
config :chat, Chat.Repo,
  migration_timestamps: [type: :utc_datetime_usec],
  username: System.get_env("USER"),
  password: "",
  database: "chat_readstore_test",
  hostname: "localhost",
  pool_size: 1
