require_relative "../../lib/scrapper/SupermarketScrapper.rb"

PRICES_XPATH = "//span[@class='atg_store_productPrice'][not(contains(@style, 'visibility: hidden'))] | //div[@class='first_price_discount_container']/span[@class='price_discount']"
TITLES_XPATH = "//div[@class='descrip_full']"
ICONS_XPATH = "//span[@class='atg_store_productImage']/img"

URLS_ARRAY = [
	["bebidas_con_alcohol", "https://www.cotodigital3.com.ar/sitios/cdigi/browse/catalogo-bebidas-bebidas-con-alcohol/_/N-4hulsc"],
	["bebidas_sin_alcohol", "https://www.cotodigital3.com.ar/sitios/cdigi/browse/catalogo-bebidas-bebidas-sin-alcohol/_/N-j9f2pv"],
	["lacteos", "https://www.cotodigital3.com.ar/sitios/cdigi/browse/catalogo-frescos-l%C3%A1cteos/_/N-1d443r9"],
	["golosinas", "https://www.cotodigital3.com.ar/sitios/cdigi/browse/catalogo-almac%C3%A9n-golosinas/_/N-1y5dh9i"],
	["infusiones", "https://www.cotodigital3.com.ar/sitios/cdigi/browse/catalogo-almac%C3%A9n-infusiones/_/N-dw58vw"]
]

SECTION_XPATHS = [
    ["bebidas_con_alcohol", "price", PRICES_XPATH],
    ["bebidas_con_alcohol", "title", TITLES_XPATH],
    ["bebidas_con_alcohol", "photo", ICONS_XPATH],
    ["bebidas_sin_alcohol", "price", PRICES_XPATH],
    ["bebidas_sin_alcohol", "title", TITLES_XPATH],
    ["bebidas_sin_alcohol", "photo", ICONS_XPATH],
    ["lacteos", "price", PRICES_XPATH],
    ["lacteos", "title", TITLES_XPATH],
    ["lacteos", "photo", ICONS_XPATH],
    ["golosinas", "price", PRICES_XPATH],
    ["golosinas", "title", TITLES_XPATH],
    ["golosinas", "photo", ICONS_XPATH],
    ["infusiones", "price", PRICES_XPATH],
    ["infusiones", "title", TITLES_XPATH],
    ["infusiones", "photo", ICONS_XPATH],
]

FILTER_CATEGORIES = [
    ['bebidas_con_alcohol', 'Cerveza'],
    ['bebidas_con_alcohol', 'Vino'],
    ['bebidas_con_alcohol', 'Aperitivos'],
    ['bebidas_con_alcohol', 'Champagne'],
    ['bebidas_sin_alcohol', 'Agua'],
    ['bebidas_sin_alcohol', 'Agua Saborizada'],
    ['bebidas_sin_alcohol', 'Gaseosa'],
    ['bebidas_sin_alcohol', 'Bebida Isotónica'],
    ['bebidas_sin_alcohol', 'Energizante'],
    ['bebidas_sin_alcohol', 'Jugo'],
    ['lacteos', 'Leche'],
    ['lacteos', 'Yogur'],
    ['lacteos', 'Vegetal'],
    ['lacteos', 'Levadura'],
    ['lacteos', 'Ricotta'],
    ['golosinas', 'Chocolate'],
    ['golosinas', 'Alfajor'],
    ['golosinas', 'Pastillas'],
    ['golosinas', 'Gomitas'],
    ['golosinas', 'Gelatinas'],
    ['infusiones', 'Mate'],
    ['infusiones', 'Te'],
    ['infusiones', 'Cafe'],
    ['infusiones', 'Mate cocido'],
]

class ProductsController < ApplicationController
	def index
		Product.erase_all
		Url.erase_all
		XPath.erase_all
		Category.erase_all

		URLS_ARRAY.each {
			|url_row|
			Url.new(section:"#{url_row[0]}", url:"#{url_row[1]}").save
		}

		SECTION_XPATHS.each {
			|x_paths_row|
			XPath.new(section: "#{x_paths_row[0]}", section_attribute: "#{x_paths_row[1]}", xpath: "#{x_paths_row[2]}").save
		}

		FILTER_CATEGORIES.each {
			|filter_row|
			Category.new(section: "#{filter_row[0]}", category: "#{filter_row[1]}").save

		}
	end

	def invalid_product
	end

	def button
		Product.erase_all

		section_name = params["section_name"]
		# Utilizamos el section_name para scrappear lo seleccionado por el usuario.

		included_products = ["bebidas_con_alcohol", "bebidas_sin_alcohol", "lacteos", "golosinas", "infusiones"]

		if !included_products.include?(section_name)
            render '/products/invalid_product'
        end

		categories = Category.get_filter_categories(section_name)
		xpaths = XPath.get_xpaths(section_name)

		info_hash = {
			'categories' => categories,
			'xpaths' => xpaths
		}

		url_to_scrap = Url.get_url(section_name)

		scrapper = SupermarketScrapper.new
		scrapper.process_pages_from_url(url_to_scrap, info_hash)

		@product_list = Product.all
		@product_list = @product_list.order_by_likes(@product_list)

		# redirect_to "/errors/index"
		render '/products/' + params["section_name"]
	end

	def filter_button
		@product_list = Product.all
		@product_list = @product_list.filter_by_params(params)
		@product_list = @product_list.order_by_likes(@product_list)

		render '/products/' + params["section_name"]
	end

	def like_product
		Like.update_likes(params)

		@product_list = Product.all
		@product_list = @product_list.order_by_likes(@product_list)

		# Redirecciona sin tener el cuenta los params, el render los tiene en cuenta.
		redirect_to "/#{params["section_name"]}"
	end

	def star_product
		Star.add_product(params[:plu])

		@product_list = Product.all
		@product_list = @product_list.order_by_likes(@product_list)

		redirect_to "/#{params["section_name"]}"
	end

	def show_error_page
        # redirect_to "/layouts/scrapping_error"
        
    end
end
