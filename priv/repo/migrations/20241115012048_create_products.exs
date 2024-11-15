defmodule Foods.Repo.Migrations.CreateProducts do
  use Ecto.Migration

  def change do
    create table(:products) do
      add :name, :string
      add :prots, :float
      add :fats, :float
      add :hydro, :float

      timestamps(type: :utc_datetime)
    end
  end
end
