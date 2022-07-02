require_relative "../parser/parser.rb"
require_relative "../parser/productFilter.rb"

class ProductAdapter
    def to_products(data_to_adapt, categories)
        products_to_adapt = set_data(data_to_adapt)

        # Llama al filter para filtrar a los no deseados (le pasa array).

        product_filter = ProductFilter.new
        products_filtered = product_filter.filter_products(products_to_adapt, categories)

        # Llama al parser para parsear a los deseados (le pasa cada producto).

        products = []

        parser = Parser.new

        products_filtered.each {
            |product_to_parse|
            product_parsed = parser.parse(product_to_parse, categories)
            products << product_parsed
        }

        # Devuelve el array de hashes adaptado (lo arma).
        return products
    end

    def set_data(data_to_adapt)
        products_to_adapt = []

        products_data_array = data_to_adapt[0].zip(data_to_adapt[1], data_to_adapt[2], data_to_adapt[3])

        products_data_array.each {
            |product_data|

            # AGREGAR EN EL PARSER!!!
            plu = product_data[3].text.gsub "(", ""
            plu = plu.gsub ")", ""

            product_to_adapt = {
                "title" => product_data[0].text,
                "price" => product_data[1].text,
                "icon" => product_data[2]['src'],
                "plu" => plu
            }

            products_to_adapt << product_to_adapt 
        }

        return products_to_adapt
    end 
end