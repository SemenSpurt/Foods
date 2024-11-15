defmodule Foods.FoodFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Foods.Food` context.
  """

  @doc """
  Generate a product.
  """
  def product_fixture(attrs \\ %{}) do
    {:ok, product} =
      attrs
      |> Enum.into(%{
        fats: 120.5,
        hydro: 120.5,
        name: "some name",
        prots: 120.5
      })
      |> Foods.Food.create_product()

    product
  end
end
