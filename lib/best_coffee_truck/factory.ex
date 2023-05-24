defmodule BestCoffeeTruck.Factory do
  use ExMachina.Ecto, repo: BestCoffeeTruck.Repo

  alias BestCoffeeTruck.Ratings.Rating
  alias BestCoffeeTruck.Trucks.Truck

  def truck_factory do
    %Truck{
      name: sequence("truck_name"),
      menu: ""
    }
  end

  def rating_factory do
    %Rating{
      truck: build(:truck),
      rating: 3
    }
  end
end
