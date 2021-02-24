# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :elixir_project,
  ecto_repos: [ElixirProject.Repo]

# Configures the endpoint
config :elixir_project, ElixirProjectWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "4mbl04Pi61ZZxycfZ0O2upijHSBkp+3tPhy69Mosybfq11vzVKTXgbtP5akpgOzW",
  render_errors: [view: ElixirProjectWeb.ErrorView, accepts: ~w(json), layout: false],
  pubsub_server: ElixirProject.PubSub,
  live_view: [signing_salt: "WsgL9Yoz"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
