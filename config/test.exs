import Config

# Env vars for postgres
if File.exists?(".env") do
  for line <- File.read!(".env") |> String.split("\n") do
    case String.split(line, "=", parts: 2) do
      [key, value] -> System.put_env(String.trim(key), String.trim(value))
      _ -> :ok
    end
  end
end

# Configure your database
#
# The MIX_TEST_PARTITION environment variable can be used
# to provide built-in test partitioning in CI environment.
# Run `mix help test` for more information.
config :retrack, Retrack.Repo,
  username: "postgres",
  password: System.get_env("DB_PASSWORD", "postgres"),
  hostname: "localhost",
  database: "retrack_test#{System.get_env("MIX_TEST_PARTITION")}",
  pool: Ecto.Adapters.SQL.Sandbox,
  pool_size: System.schedulers_online() * 2

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :retrack_web, RetrackWeb.Endpoint,
  http: [ip: {127, 0, 0, 1}, port: 4002],
  secret_key_base: "M9cYR/v1GCZhC3ElQui7eEYD1DJA3LXVLSi82TbSBOnLcqMiYI0PAU8/DNhmcQqD",
  server: false

# Print only warnings and errors during test
config :logger, level: :warning

# In test we don't send emails
config :retrack, Retrack.Mailer, adapter: Swoosh.Adapters.Test

# Disable swoosh api client as it is only required for production adapters
config :swoosh, :api_client, false

# Initialize plugs at runtime for faster test compilation
config :phoenix, :plug_init_mode, :runtime

# Enable helpful, but potentially expensive runtime checks
config :phoenix_live_view,
  enable_expensive_runtime_checks: true

# Sort query params output of verified routes for robust url comparisons
config :phoenix,
  sort_verified_routes_query_params: true
