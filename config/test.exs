use Mix.Config

# Configure your database
config :mtapes, Mtapes.Repo,
  username: "postgres",
  password: "postgres",
  database: "mtapes_test",
  hostname: "localhost",
  pool: Ecto.Adapters.SQL.Sandbox

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :mtapes, MtapesWeb.Endpoint,
  http: [port: 4002],
  server: false

# Print only warnings and errors during test
config :logger, level: :warn
