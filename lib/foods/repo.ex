defmodule Foods.Repo do
  use Ecto.Repo,
    otp_app: :foods,
    adapter: Ecto.Adapters.Postgres
end
