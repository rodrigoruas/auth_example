defmodule Authie.Repo do
  use Ecto.Repo,
    otp_app: :authie,
    adapter: Ecto.Adapters.Postgres
end
