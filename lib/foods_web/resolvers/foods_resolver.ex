defmodule FoodsWeb.FoodsResolver do
    alias Foods.Food
  
    def all_products(_root, _args, _info) do
      {:ok, Food.list_products()}
    end
  end