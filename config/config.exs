# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :mtapes,
  ecto_repos: [Mtapes.Repo]

# Configures the endpoint
config :mtapes, MtapesWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "OVERRIDE",
  render_errors: [view: MtapesWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: Mtapes.PubSub, adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

config :mtapes, :pow,
  user: Mtapes.Users.User,
  repo: Mtapes.Repo,
  web_module: MtapesWeb


config :spotify_ex,
  user_id: "jurbanik",
  scopes: ["playlist-read-private", "playlist-read-collaborative"],
  callback_url: "http://localhost:4000"

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"

# Finally import the config/secret.exs which loads secrets
# and configuration from environment variables.
import_config "secret.exs"
