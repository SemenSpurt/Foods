defmodule Foods.Food.Product do
  use Ecto.Schema
  import Ecto.Changeset

  schema "products" do
    field :name, :string
    field :prots, :float
    field :fats, :float
    field :hydro, :float

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(product, attrs) do
    product
    |> cast(attrs, [:name, :prots, :fats, :hydro])
    |> validate_required([:name, :prots, :fats, :hydro])
  end
end
