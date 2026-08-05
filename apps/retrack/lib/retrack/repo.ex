defmodule Retrack.Repo do
  use Ecto.Repo,
    otp_app: :retrack,
    adapter: Ecto.Adapters.Postgres
end
