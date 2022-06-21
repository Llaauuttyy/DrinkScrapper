class ProductsController < ApplicationController
	def index
		#@product_list = Product.all
	end

	def products
		@product_list = Product.all
		@product_list = @product_list.filter_by_params(params)
	end

	def drinks_with_alcohol
		# fill products
		@product_list = Product.all
		@product_list = @product_list.filter_by_params(params)
	end

	def drinks_without_alcohol
		# fill products
		@product_list = Product.all
		@product_list = @product_list.filter_by_params(params)
	end

	def candies
		# fill products
		@product_list = Product.all
		@product_list = @product_list.filter_by_params(params)
	end

	def cereal_bars
		# fill products
		@product_list = Product.all
		@product_list = @product_list.filter_by_params(params)
	end

	def invalid_product
	end

	def button
		section_name = params["section_name"]
		# Utilizamos el section_name para scrappear lo seleccionado por el usuario.
	end
end
