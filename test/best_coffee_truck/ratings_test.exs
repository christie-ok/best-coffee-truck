defmodule BestCoffeeTruck.RatingsTest do
  use BestCoffeeTruck.DataCase

  alias BestCoffeeTruck.Ratings

  describe "ratings" do
    alias BestCoffeeTruck.Ratings.Rating

    @invalid_attrs %{rating: nil}

    test "list_ratings/0 returns all ratings" do
      rating = insert(:rating) |> forget(:truck)
      assert Ratings.list_ratings() == [rating]
    end

    test "create_rating/1 with valid data creates a rating" do
      truck = insert(:truck)
      valid_attrs = %{rating: 4, truck_id: truck.id}

      assert {:ok, %Rating{} = rating} = Ratings.create_rating(valid_attrs)
      assert rating.rating == 4
    end

    test "create_rating/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Ratings.create_rating(@invalid_attrs)
    end

    test "change_rating/1 returns a rating changeset" do
      rating = insert(:rating)
      assert %Ecto.Changeset{} = Ratings.change_rating(rating)
    end
  end

  describe "average_rating_by_truck_id/0" do
    test "returns map of truck ids to average ratings and count of ratings" do
      truck_1 = insert(:truck, id: 1)
      truck_2 = insert(:truck, id: 2)
      _truck_1_rating_1 = insert(:rating, rating: 1, truck: truck_1)
      _truck_1_rating_2 = insert(:rating, rating: 5, truck: truck_1)
      _truck_2_rating_1 = insert(:rating, rating: 2, truck: truck_2)

      assert %{
               1 => %{average_rating: 3.0, ratings_count: 2},
               2 => %{average_rating: 2.0, ratings_count: 1}
             } == Ratings.average_rating_by_truck_id()
    end
  end

  def forget(struct, field, cardinality \\ :one) do
    %{
      struct
      | field => %Ecto.Association.NotLoaded{
          __field__: field,
          __owner__: struct.__struct__,
          __cardinality__: cardinality
        }
    }
  end
end
