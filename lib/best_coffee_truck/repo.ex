defmodule BestCoffeeTruck.Repo do
  use Ecto.Repo,
    otp_app: :best_coffee_truck,
    adapter: Ecto.Adapters.Postgres
end
