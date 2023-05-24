defmodule Mix.Tasks.ImportTrucks do
  @moduledoc "Inserts list of trucks into database.
  Start the shell and Run: `Mix.Tasks.ImportTrucks.run([])`"

  alias BestCoffeeTruck.Trucks

  @path "priv/Mobile_Food_Facility_Permit.csv"

  def run(_) do
    @path
    |> File.stream!()
    |> CSV.decode(headers: true)
    |> Enum.to_list()
    |> Enum.map(fn {_, truck} ->
      %{
        name: truck["Applicant"],
        menu: truck["FoodItems"]
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
