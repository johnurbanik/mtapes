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
  secret_key_base: "MgnH4Q8BVNhiBdCnuM9B9K49Y1NoniWb3Y8kDKeqBu6518N178ZEliZcYNTPFyAJ",
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

config :mtapes, :pow_assent,
  providers: [
    facebook: [
      client_id: "601464147317428",
      client_secret: "36ac3623c811640e01812c920d39750c",
      strategy: Assent.Strategy.Facebook
    ]
  ]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
