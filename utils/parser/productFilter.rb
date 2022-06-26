class ProductFilter

    def correct_category(product_hash,categories)
        
        contador = 0
        encontrado = false
        while (contador < categories.length && !encontrado)
            if (product_hash['rawTitle'].include?(categories[contador]))
                encontrado = true
            end
            contador = contador + 1
        end
        return encontrado
    end

    def filter_product(array_product_to_be_filtered, categorias)
        
        excepcion = ['Pack', 'X', 'Saquitos','Saq','Kgm','Kg']
        array_product_filtered = []
        array_product_to_be_filtered.each do |hash| #SI DEVUELVO FALSE GUARDO EL PRODUCTO EN UN ARRAY PARA USAR DESPUES
            next if !correct_category(hash,categorias)
            next if correct_category(hash,excepcion)
            array_product_filtered.push(hash)
        end
        return array_product_filtered
    end
end