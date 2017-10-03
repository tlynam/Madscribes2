# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :madscribes2,
  ecto_repos: [Madscribes2.Repo]

# Configures the endpoint
config :madscribes2, Madscribes2.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "yFJPrHfa7xatbK/2tCALHEDBQyxalzGuocTKpl4hd5jlSmNCJcqnT4aSbJL/wTbU",
  render_errors: [view: Madscribes2.ErrorView, accepts: ~w(html json)],
  pubsub: [name: Madscribes2.PubSub,
           adapter: Phoenix.PubSub.PG2],
  ownership_timeout: 9999999,
  timeout: 9999999,
  pool_timeout: 9999999

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
