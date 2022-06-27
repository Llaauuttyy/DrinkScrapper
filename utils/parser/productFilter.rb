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

            next if !is_category_wanted(product_hash, categories)
            # next if is_category_wanted(product_hash,excepcion)

            products_filtered.push(product_hash)
        end

        return products_filtered
    end
end