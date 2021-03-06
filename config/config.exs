# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :test_api,
  ecto_repos: [TestApi.Repo]

# Configures the endpoint
config :test_api, TestApiWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "lr4QUKiaXqRcPR4rnAa6rThQesw1U3MTr8Yn6Kb/fnG3OqnEWTT4Wnf6PJXtXT8Z",
  render_errors: [view: TestApiWeb.ErrorView, accepts: ~w(json), layout: false],
  pubsub_server: TestApi.PubSub,
  live_view: [signing_salt: "rDOPIJ42"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"

# Guardian
config :test_api, TestApiWeb.Auth.Guardian,
  issuer: "test_api",
  secret_key: "vUdygfk656ngFKZsuBR9huBSsfD0qw0eY5pO0o7eFTf5igHj312nKmSpZWbbAo5O"
