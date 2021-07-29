use Mix.Config

# Configure your database
config :test_api, TestApi.Repo,
  username: "postgres",
  password: "",
  database: "test_api_dev",
  hostname: "localhost",
  port: 5432,
  pool: Ecto.Adapters.SQL.Sandbox

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :test_api, TestApiWeb.Endpoint,
  http: [port: 4002],
  server: false

# Print only warnings and errors during test
config :logger, level: :warn
