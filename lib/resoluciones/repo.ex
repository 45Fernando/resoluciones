defmodule Resoluciones.Repo do
  use Ecto.Repo,
    otp_app: :resoluciones,
    adapter: Ecto.Adapters.Postgres
end
