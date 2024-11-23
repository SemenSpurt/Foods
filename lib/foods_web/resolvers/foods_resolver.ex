defmodule FoodsWeb.FoodsResolver do
    alias Foods.Food
    alias UUID
  
    def all_products(_root, _args, _info) do
      {:ok, Food.list_products()}
    end

    # def product(%{id: id}, _info) do
    #   with {:ok, info} <- UUID.info(id),
    #   product <- Food.get_product!(id)
    #   do
    #     {:ok, product}
    #   else
    #     {:error, error} -> {:error, "No tag found"}
    #   end
    # end

    def get(%{id: id}, _info) do
      {:ok, Food.get_product!(id)}
    end

    def create_product(_root, args, _info) do
      case Food.create_product(args) do
        {:ok, product} ->
          {:ok, product}
        _error ->
          {:error, "could not create product"}
      end
    end

    def update_product(%{id: id, attrs: attrs}, info) do
      case get(%{id: id}, info) do
        {:ok, product} -> product |> Food.update_product(attrs)
        {:error, _} -> {:error, "Failed to update product"}
      end
    end

    def delete_product(%{id: id}, info) do
      case get(%{id: id}, info) do
        {:ok, product} -> Food.delete_product(product)
        {:error, _} -> {:error, "Failed to update product"}
      end
    end
  end