defmodule BestCoffeeTruck.Repo.Migrations.CreateRatings do
  use Ecto.Migration

  def change do
    create table(:ratings) do
      add :rating, :integer
      add :truck_id, references(:trucks, on_delete: :nothing)

      timestamps()
    end

    create index(:ratings, [:truck_id])
  end
end
