require_relative "../parser/parser.rb"
require_relative "../parser/productFilter.rb"

class ProductAdapter
    def to_products(data_to_adapt)
        products_to_adapt = set_data(data_to_adapt)

        categories = ['Agua', 'Agua Saborizada', 'Gaseosa','Bebida Isotónica', 'Energizante','Jugo']

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

        products_data_array = data_to_adapt[0].zip(data_to_adapt[1], data_to_adapt[2])

        products_data_array.each {
            |product_data|

            product_to_adapt = {
                "title" => product_data[0].text,
                "price" => product_data[1].text,
                "icon" => product_data[2]['src']
            }

            products_to_adapt << product_to_adapt 
        }

        return products_to_adapt
    end 
end