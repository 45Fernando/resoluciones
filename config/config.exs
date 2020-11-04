# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :resoluciones,
  ecto_repos: [Resoluciones.Repo]

# Configures the endpoint
config :resoluciones, ResolucionesWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "+25TIWtRIhdCNKdJweVGp+Lh6sSFePrItERl++nmRs3xKdkOAlnVdQ7vgc0ZAqvm",
  render_errors: [view: ResolucionesWeb.ErrorView, accepts: ~w(html json), layout: false],
  pubsub_server: Resoluciones.PubSub,
  live_view: [signing_salt: "UWdNDysE"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
