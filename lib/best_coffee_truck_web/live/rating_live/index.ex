defmodule BestCoffeeTruckWeb.RatingLive.Index do
  use BestCoffeeTruckWeb, :live_view

  alias BestCoffeeTruck.Ratings.Rating
  alias BestCoffeeTruck.Trucks

  @impl true
  def mount(_params, _session, socket) do
    {:ok, socket}
  end

  @impl true
  def handle_params(params, _url, socket) do
    {:noreply, apply_action(socket, socket.assigns.live_action, params)}
  end

  defp apply_action(socket, :new, params) do
    %{"truck_id" => truck_id} = params
    truck_id = id_to_integer(truck_id)
    %{name: truck_name} = Trucks.get_truck!(truck_id)

    socket
    |> assign(:page_title, "New Rating for the coffee at #{truck_name}")
    |> assign(:rating, %Rating{truck_id: truck_id})
  end

  @impl true
  def handle_info({BestCoffeeTruckWeb.RatingLive.FormComponent, {:saved, rating}}, socket) do
    {:noreply, stream_insert(socket, :ratings, rating)}
  end

  defp id_to_integer(id), do: String.to_integer(id)
end
