use Mix.Config

priv_dir = Path.join([__DIR__, "..", "priv"])
certfile = Path.join(priv_dir, "server.pem")
keyfile = Path.join(priv_dir, "server.key")

unless File.exists?(keyfile) do
  raise """
  No SSL key/cert found. Please run the following command:

  openssl req -new -newkey rsa:4096 -days 365 -nodes -x509  \
  -subj "/C=US/ST=Denial/L=Springfield/O=Dis/CN=www.example.com" \
  -keyout priv/server.key -out priv/server.pem
  """
end

# For development, we disable any cache and enable
# debugging and code reloading.
#
# The watchers configuration can be used to run external
# watchers to your application. For example, we use it
# with brunch.io to recompile .js and .css sources.
config :madscribes2, Madscribes2.Endpoint,
  http: [port: 4000],
  https: [
    port: 4001,
    certfile: certfile,
    keyfile: keyfile
  ],
  handler: Phoenix.Endpoint.Cowboy2Handler,
  debug_errors: true,
  code_reloader: true,
  check_origin: false,
  watchers: [node: ["node_modules/brunch/bin/brunch", "watch", "--stdin",
                    cd: Path.expand("../", __DIR__)]]


# Watch static and templates for browser reloading.
config :madscribes2, Madscribes2.Endpoint,
  live_reload: [
    patterns: [
      ~r{priv/static/.*(js|css|png|jpeg|jpg|gif|svg)$},
      ~r{priv/gettext/.*(po)$},
      ~r{web/views/.*(ex)$},
      ~r{web/templates/.*(eex)$}
    ]
  ]

# Do not include metadata nor timestamps in development logs
config :logger, :console, format: "[$level] $message\n"

# Set a higher stacktrace during development. Avoid configuring such
# in production as building large stacktraces may be expensive.
config :phoenix, :stacktrace_depth, 20

# Configure your database
config :madscribes2, Madscribes2.Repo,
  adapter: Ecto.Adapters.Postgres,
  database: "madscribes2_dev",
  hostname: "localhost",
  pool_size: 10
