defmodule FoodsWeb.Schema do
    use Absinthe.Schema
  
    alias FoodsWeb.FoodsResolver
  
    object :product do
      field :id, non_null(:id)
      field :name, non_null(:string)
      field :prots, non_null(:float)
      field :fats, non_null(:float)
      field :hydro, non_null(:float)
    end
  
    query do
      @desc "Get all products"
      field :all_products, non_null(list_of(non_null(:product))) do
        resolve(&FoodsResolver.all_products/3)
      end
    end

    mutation do
      @desc "Create a new link"
      field :create_product, :product do
        arg :name, non_null(:string)
        arg :prots, non_null(:float)
        arg :fats, non_null(:float)
        arg :hydro, non_null(:float)
      
        resolve &FoodsResolver.create_product/3
      end

    #   @desc "Create a new link"
    #   field :delete_product, :product do
    #     arg :id, non_null(:integer)
      
    #     resolve &FoodsResolver.delete_product/3
    #   end
    end

end