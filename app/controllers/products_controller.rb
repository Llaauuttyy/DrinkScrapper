class ProductsController < ApplicationController
	def index
		#@product_list = Product.all
	end

	def invalid_product
	end

	def button
		section_name = params["section_name"]
		# Utilizamos el section_name para scrappear lo seleccionado por el usuario.

		included_products = ["bebidas_con_alcohol", "bebidas_sin_alcohol", "lacteos", "golosinas", "infusiones"]

		if !included_products.include?(section_name)
            render '/products/invalid_product'
			return
        end

		@product_list = Product.all
		@product_list = @product_list.filter_by_params(params)
	
		render '/products/' + params["section_name"]
	end
end
