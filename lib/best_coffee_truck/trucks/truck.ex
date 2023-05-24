defmodule BestCoffeeTruck.Trucks.Truck do
  use Ecto.Schema
  import Ecto.Changeset

  schema "trucks" do
    field :menu, :string
    field :name, :string

    timestamps()
  end

  @doc false
  def changeset(truck, attrs) do
    truck
    |> cast(attrs, [:name, :menu])
    |> validate_required([:name, :menu])
    |> maybe_trim_menu()
  end

  defp maybe_trim_menu(changeset) do
    menu = get_change(changeset, :menu)

    menu =
      if menu && String.length(menu) > 255 do
        String.slice(menu, 0..254)
      else
        menu
      end

    put_change(changeset, :menu, menu)
  end
end
