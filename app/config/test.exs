import Config

# Configure your database
#
# The MIX_TEST_PARTITION environment variable can be used
# to provide built-in test partitioning in CI environment.
# Run `mix help test` for more information.
config :test_service, TestService.Repo,
  username: "postgres",
  password: "postgres",
  hostname: "localhost",
  database: "test_service_test#{System.get_env("MIX_TEST_PARTITION")}",
  pool: Ecto.Adapters.SQL.Sandbox,
  pool_size: 10

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :test_service, TestServiceWeb.Endpoint,
  http: [ip: {127, 0, 0, 1}, port: 4002],
  secret_key_base: "2ioWvUzSrcbh4uMp0VEs5+fPUoqY46U8pxLlpBoueP/ckhYpxPlJYQsvKsw/zkhZ",
  server: false

# In test we don't send emails.
config :test_service, TestService.Mailer, adapter: Swoosh.Adapters.Test

# Print only warnings and errors during test
config :logger, level: :warn

# Initialize plugs at runtime for faster test compilation
config :phoenix, :plug_init_mode, :runtime
