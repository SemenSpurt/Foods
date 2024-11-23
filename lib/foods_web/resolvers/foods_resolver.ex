defmodule FoodsWeb.FoodsResolver do
    alias Foods.Food
  
    def all_products(_root, _args, _info) do
      {:ok, Food.list_products()}
    end

    def create_product(_root, args, _info) do
      case Food.create_product(args) do
        {:ok, product} ->
          {:ok, product}
        _error ->
          {:error, "could not create product"}
      end
    end



    # def delete_product(_root, args, _info) do
    #   product = Food.get_product!(args)
    #   case Food.delete_product(product) do
    #     {:ok} ->
    #       {:ok, "product has been deleted"}
    #     _error ->
    #       {:error, "could not create product"}
    #   end
    # end
  end