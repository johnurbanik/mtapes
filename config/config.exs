# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :playlistr,
  ecto_repos: [Playlistr.Repo]

# Configures the endpoint
config :playlistr, PlaylistrWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "d+N2t3jTN+o9ZPSFv8Yzh57hexbaS1H96NRg77/8AcFvKVg/ircyLeAreNqNzv0d",
  render_errors: [view: PlaylistrWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: Playlistr.PubSub, adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
