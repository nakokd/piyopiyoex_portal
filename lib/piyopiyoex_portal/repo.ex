defmodule PiyopiyoexPortal.Repo do
  use Ecto.Repo,
    otp_app: :piyopiyoex_portal,
    adapter: Ecto.Adapters.Postgres
end
