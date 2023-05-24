defmodule BestCoffeeTruckWeb.RatingLiveTest do
  use BestCoffeeTruckWeb.ConnCase

  import Phoenix.LiveViewTest

  alias BestCoffeeTruck.Ratings

  @create_attrs %{rating: 4}
  @invalid_attrs %{rating: nil}

  describe "Index" do
    test "saves new rating", %{conn: conn} do
      insert(:truck, id: 1)
      {:ok, index_live, _html} = live(conn, ~p"/ratings/new/1")

      assert index_live
             |> form("#rating-form", rating: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      assert index_live
             |> form("#rating-form", rating: @create_attrs)
             |> render_submit()

      assert_redirected(index_live, "/trucks")

      assert [%{truck_id: 1, rating: 4}] = Ratings.list_ratings()
    end
  end
end
