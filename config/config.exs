# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :try_phx,
  ecto_repos: [TryPhx.Repo]

# Configures the endpoint
config :try_phx, TryPhxWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "KGDidSza8FeSswPp5Ruvybo3E3Y32zIpOAiIhpevbC2qGPihhMwD42/SbcIvb3mT",
  render_errors: [view: TryPhxWeb.ErrorView, accepts: ~w(html json), layout: false],
  pubsub_server: TryPhx.PubSub,
  live_view: [signing_salt: "7K6vek74"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
