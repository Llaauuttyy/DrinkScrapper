class Parser
    
    def parse(product_hash, categories)
        product_parsed = {
            'name' => '',
            'photo' => '',
            'price' => '',
            'size' => '',
            'category' => ''
        }

        producto_split = product_hash['title'].split(' ')

        product_parsed['name'] = parse_name(producto_split)
        product_parsed['photo'] = product_hash['icon']
        product_parsed['price'] = parse_price(product_hash)
        product_parsed['category'] = parse_category(product_hash, categories)
        product_parsed['size'] = parse_size(product_hash)

        # puts "#{product_parsed['name']}"
        # puts "#{product_parsed['price']}"
        # puts "#{product_parsed['category']}"
        # puts "#{product_parsed['size']}"

        return product_parsed
    end

    def parse_category(product_hash, categories)
        counter = 0
        found = false

        while (counter < categories.length && !found)
            if (product_hash['title'].include?(categories[counter]))
                found = true
            end
            counter = counter + 1
        end

        return categories[counter-1]
    end

    def parse_price(product_hash)
        price_parsed = product_hash['price'].split('$')

        price_parsed = price_parsed[1].split(' ')
        price_parsed = price_parsed[0].split(',')

        price_parsed[0] = price_parsed[0].to_i
        price_parsed[1] = price_parsed[1].to_i

        price = 0

        if price_parsed[1] >= 50
            price = ((price_parsed[0]).to_i + 1).to_s
        else
            price = ((price_parsed[0]).to_i).to_s
        end

        return price
    end

    def parse_size(product_hash)
        product_hash['title'].gsub! ',', '.'
        producto_split = product_hash['title'].split(' ')

        size = 0

        if (producto_split.include?('Grm'))
            size = producto_split[producto_split.length - 2] + 'Gr'
        else
            cantidad_to_compare = (producto_split[producto_split.length - 2]).to_f
            if cantidad_to_compare > 7
                size = ((cantidad_to_compare / 1000).to_s) + 'L'
            else
                size = (cantidad_to_compare).to_s + 'L'
            end
        end
    end

    def parse_name(producto_split)
        producto_split.delete_at((producto_split.length) -2)
        producto_split.delete_at((producto_split.length) -1)

        name = ''

        producto_split.each do 
            |element|

            name = name + element + ' '
        end

        return name
    end
end