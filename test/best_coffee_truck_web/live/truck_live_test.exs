defmodule BestCoffeeTruckWeb.TruckLiveTest do
  use BestCoffeeTruckWeb.ConnCase

  import Phoenix.LiveViewTest

  defp create_truck(_) do
    truck = insert(:truck)
    %{truck: truck}
  end

  describe "Index" do
    setup [:create_truck]

    test "lists all trucks", %{conn: conn, truck: truck} do
      {:ok, _index_live, html} = live(conn, ~p"/trucks")

      assert html =~ "Listing Trucks"
      assert html =~ truck.menu
    end
  end
end
