defmodule FoodsWeb.Schema do
    use Absinthe.Schema
  
    alias FoodsWeb.FoodsResolver
  
    object :product do
      field :id, non_null(:integer)
      field :name, non_null(:string)
      field :prots, non_null(:float)
      field :fats, non_null(:float)
      field :hydro, non_null(:float)
    end

    input_object :product_params do
      field :name, :string
      field :prots, :float
      field :fats, :float
      field :hydro, :float
    end
  
    query do
      @desc "Get all products"
      field :all_products, non_null(list_of(non_null(:product))) do
        resolve(&FoodsResolver.all_products/3)
      end

      @desc "Get one product"
      field :product, type: :product do 
        arg :id,  non_null(:id)
        resolve &FoodsResolver.get/2
      end
    end

    mutation do
      @desc "Create a new product"
      field :create_product, :product do
        arg :name, non_null(:string)
        arg :prots, non_null(:float)
        arg :fats, non_null(:float)
        arg :hydro, non_null(:float)
      
        resolve &FoodsResolver.create_product/3
      end

      @desc "Update product"
      field :update_product, :product do
        arg :id,  non_null(:id)
        arg :attrs, :product_params
        
        resolve &FoodsResolver.update_product/2
      end

      @desc "Delete product"
      field :delete_product, :product do
        arg :id,  non_null(:id)
      
        resolve &FoodsResolver.delete_product/2
      end
    end

end