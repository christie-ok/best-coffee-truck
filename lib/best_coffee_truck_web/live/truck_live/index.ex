defmodule BestCoffeeTruckWeb.TruckLive.Index do
  use BestCoffeeTruckWeb, :live_view

  alias BestCoffeeTruck.Ratings
  alias BestCoffeeTruck.Trucks
  alias BestCoffeeTruck.Trucks.Truck

  @default_ratings_data %{
    average_rating: "Be the first to rate this truck's coffee!",
    ratings_count: 0
  }

  @impl true
  def mount(_params, _session, socket) do
    trucks =
      Trucks.list_trucks()
      |> decorate_trucks()

    {:ok, assign(socket, :trucks, trucks)}
  end

  @impl true
  def handle_params(params, _url, socket) do
    {:noreply, apply_action(socket, socket.assigns.live_action, params)}
  end

  defp apply_action(socket, :new, _params) do
    socket
    |> assign(:page_title, "New Truck")
    |> assign(:truck, %Truck{})
  end

  defp apply_action(socket, :index, _params) do
    socket
    |> assign(:page_title, "Listing Trucks")
    |> assign(:truck, nil)
  end

  defp decorate_trucks(trucks) do
    ratings_data = Ratings.average_rating_by_truck_id()

    trucks
    |> Enum.map(fn truck ->
      %{id: truck_id} = truck

      %{average_rating: average_rating, ratings_count: ratings_count} =
        Map.get(ratings_data, truck_id, @default_ratings_data)

      truck
      |> Map.from_struct()
      |> Map.put(:average_rating, average_rating)
      |> Map.put(:ratings_count, ratings_count)
    end)
  end
end
