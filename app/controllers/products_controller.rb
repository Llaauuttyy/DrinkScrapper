require_relative "../../lib/scrapper/SupermarketScrapper.rb"

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
        end

		scrapper = SupermarketScrapper.new
		url_to_scrap = Url.get_url(section_name)
		scrapper.process_pages_from_url(url_to_scrap)

		@product_list = @product_list.filter_by_params(params)
	
		render '/products/' + params["section_name"]
	end
end
