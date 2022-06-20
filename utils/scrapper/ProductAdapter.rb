class ProductAdapter
    def initialize()
    end

    def to_products(data_to_adapt)
        products_to_adapt = set_data(data_to_adapt)

        # Llama al filter para filtrar a los no deseados (le pasa array).

        # Llama al parser para parsear a los deseados (le pasa cada producto).

        # Devuelve el array de hashes adaptado (lo arma).
    end

    def set_data(data_to_adapt)
        products_to_adapt = []

        products_data_array = data_to_adapt[0].zip(data_to_adapt[1], data_to_adapt[2])

        products_data_array.each {
            |product_data|

            product_to_adapt = {
                "title" => product_data[0],
                "price" => product_data[1],
                "icon" => product_data[2]
            }

            products_to_adapt << product_to_adapt 
        }

        # puts products_to_adapt
        return products_to_adapt
    end 
end