require_relative "PageScrapper.rb"
require_relative "ProductsScrapper.rb"
require_relative "ProductAdapter.rb"

MAX_PAGES_TO_SCRAP = 1

class SupermarketScrapper
    # Se encarga de controlar el flujo de scrapping de las paginas y los productos.
    def initialize
        @page_scrapper = PageScrapper.new
        @products_scrapper = ProductsScrapper.new
        @product_adapter = ProductAdapter.new
    end

    def process_page(page_to_scrap, info_hash)
        data_scrapped = @products_scrapper.scrap(page_to_scrap, info_hash["xpaths"])

        # Paso toda la info al product adapter y este se encargar de armar el hash que luego se usa con el parser
        # El adapter me adapta el array principal al de productos final para cargar a la base.
        products_array = @product_adapter.to_products(data_scrapped, info_hash["categories"])

    end

    def process_pages_from_url(page_url, info_hash)
        page_to_scrap = @page_scrapper.start_page(page_url)

        page_counter = 1

        while page_counter <= MAX_PAGES_TO_SCRAP
            products_array = process_page(page_to_scrap, info_hash)
            
            puts "HOLA: #{products_array}"


            products_array.each {
                |product|
                Product.new(plu: product['plu'], name: product['name'], category: product['category'], img_link: product['photo'], price: product['price'], size: product['size']).save
            }

            page_counter += 1
            page_to_scrap = @page_scrapper.get_next_page(page_to_scrap, page_counter)
        end
    end
end