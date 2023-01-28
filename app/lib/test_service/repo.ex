defmodule TestService.Repo do
  use Ecto.Repo,
    otp_app: :test_service,
    adapter: Ecto.Adapters.Postgres
end
