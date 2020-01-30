defmodule Mtapes.Repo do
  use Ecto.Repo,
    otp_app: :mtapes,
    adapter: Ecto.Adapters.Postgres
end
