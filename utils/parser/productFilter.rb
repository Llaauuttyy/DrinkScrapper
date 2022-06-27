class ProductFilter

    def is_category_wanted(product_hash,categories)
        
        counter = 0
        found = false
        while (counter < categories.length && !found)
            if (product_hash['title'].include?(categories[counter]))
                found = true
            end

            counter = counter + 1
        end
    
        return found
    end

    def filter_products(products_to_filter, categories)
        products_filtered = []

        products_to_filter.each do 
            |product_hash|

            next if !is_category_wanted(product_hash,categories)
            # next if is_category_wanted(product_hash,excepcion)

            products_filtered.push(product_hash)
        end

        return products_filtered
    end
end

product_hash6 = {
    'title' => "Vino Blanco . RESERO Ttb 1 Ltr",
    'price' => "$202,63",
    'icon' => 'link'
}

product_hash5 = {
    'title' => "Agua Mineral BONAQUA Sin Gas 2,5 Lt",
    'price' => "$103,49",
    'icon' => 'link'
}

product_hash4 = {
    'title' => "Gaseosa CUNNINGTON Sin Azúcar Naranja Botella 2.25 L",
    'price' => "$103,49",
    'icon' => 'link'
}

product_hash3 = {
    'title' => "Te SAINT GOTTARD Naranja Canela Y Anis Est 40 Grm",
    'price' => "$103,49",
    'icon' => 'link'
}

product_hash2 = {
    'title' => "Agua Saborizada Aquarius Uva 2,25 Lt",
    'price' => "$103,49",
    'icon' => 'link'
}

categories = ['Agua', 'Agua Saborizada', 'Gaseosa','Bebida Isotónica', 'Energizante','Jugo']
array_product_to_be_filtered = [product_hash2, product_hash3, product_hash4, product_hash5, product_hash6]

filter = ProductFilter.new
puts filter.filter_products(array_product_to_be_filtered, categories)