defmodule BestCoffeeTruck.Repo.Migrations.CreateTrucks do
  use Ecto.Migration

  def change do
    create table(:trucks) do
      add :name, :string
      add :menu, :string

      timestamps()
    end
  end
end
