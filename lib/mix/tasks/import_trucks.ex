defmodule Mix.Tasks.ImportTrucks do
  @moduledoc "Inserts list of trucks into database.
  Start the shell and Run: `Mix.Tasks.ImportTrucks.run([])`"
  use Tesla

  alias BestCoffeeTruck.Trucks
  alias BestCoffeeTruck.TrucksClient

  @base_url "https://data.sfgov.org/resource/rqzj-sfat.json"

  def run(_) do
    TrucksClient.list_trucks()
    |> Enum.map(fn truck ->
      %{
        name: truck["applicant"],
        menu: truck["fooditems"]
      }
    end)
    |> Enum.uniq_by(& &1.name)
    |> Enum.filter(&has_coffee?/1)
    |> Enum.each(&Trucks.create_truck(&1))
  end

  defp has_coffee?(truck) do
    %{menu: menu} = truck
    menu && menu =~ "coffee"
  end
end
