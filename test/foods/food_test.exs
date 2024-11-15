defmodule Foods.FoodTest do
  use Foods.DataCase

  alias Foods.Food

  describe "products" do
    alias Foods.Food.Product

    import Foods.FoodFixtures

    @invalid_attrs %{name: nil, prots: nil, fats: nil, hydro: nil}

    test "list_products/0 returns all products" do
      product = product_fixture()
      assert Food.list_products() == [product]
    end

    test "get_product!/1 returns the product with given id" do
      product = product_fixture()
      assert Food.get_product!(product.id) == product
    end

    test "create_product/1 with valid data creates a product" do
      valid_attrs = %{name: "some name", prots: 120.5, fats: 120.5, hydro: 120.5}

      assert {:ok, %Product{} = product} = Food.create_product(valid_attrs)
      assert product.name == "some name"
      assert product.prots == 120.5
      assert product.fats == 120.5
      assert product.hydro == 120.5
    end

    test "create_product/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Food.create_product(@invalid_attrs)
    end

    test "update_product/2 with valid data updates the product" do
      product = product_fixture()
      update_attrs = %{name: "some updated name", prots: 456.7, fats: 456.7, hydro: 456.7}

      assert {:ok, %Product{} = product} = Food.update_product(product, update_attrs)
      assert product.name == "some updated name"
      assert product.prots == 456.7
      assert product.fats == 456.7
      assert product.hydro == 456.7
    end

    test "update_product/2 with invalid data returns error changeset" do
      product = product_fixture()
      assert {:error, %Ecto.Changeset{}} = Food.update_product(product, @invalid_attrs)
      assert product == Food.get_product!(product.id)
    end

    test "delete_product/1 deletes the product" do
      product = product_fixture()
      assert {:ok, %Product{}} = Food.delete_product(product)
      assert_raise Ecto.NoResultsError, fn -> Food.get_product!(product.id) end
    end

    test "change_product/1 returns a product changeset" do
      product = product_fixture()
      assert %Ecto.Changeset{} = Food.change_product(product)
    end
  end
end
