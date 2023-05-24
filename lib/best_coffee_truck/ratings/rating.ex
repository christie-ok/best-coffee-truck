defmodule BestCoffeeTruck.Ratings.Rating do
  use Ecto.Schema
  import Ecto.Changeset

  @ratings 1..5

  schema "ratings" do
    field :rating, :integer

    belongs_to :truck, BestCoffeeTruck.Trucks.Truck

    timestamps()
  end

  @doc false
  def changeset(rating, attrs) do
    rating
    |> cast(attrs, [:rating, :truck_id])
    |> validate_required([:rating, :truck_id])
    |> validate_inclusion(:rating, @ratings)
  end
end
