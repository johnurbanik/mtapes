defmodule Playlistr.Repo do
  use Ecto.Repo,
    otp_app: :playlistr,
    adapter: Ecto.Adapters.Postgres
end
