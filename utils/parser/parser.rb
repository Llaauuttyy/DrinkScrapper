require "mechanize"
require "nokogiri"

DRINKS_PAGE_1 = "https://www.cotodigital3.com.ar/sitios/cdigi/browse/catalogo-bebidas-bebidas-sin-alcohol/_/N-j9f2pv"
mechanize = Mechanize.new
pagina = mechanize.get(DRINKS_PAGE_1)
precio = pagina.xpath("//span[@class='atg_store_productPrice'][not(contains(@style, 'visibility: hidden'))][1]")

def parse(array,categorias)
    
    def definir_categoria(hash,categorias)
    
        contador = 0
        encontrado = false
        while (contador < categorias.length && !encontrado)
            if (hash['rawTitle'].include?(categorias[contador]))
                encontrado = true
            end
            contador = contador + 1
        end
        return categorias[contador-1]
    end

    product_parsed = {
        'nombre' => '',
        'foto' => '',
        'precio' => '',
        'cantidad' => '',
        'categoria' => ''
        # 'descuento' => ''
    }
    array.each do |hash|
        product_parsed['categoria'] = definir_categoria(hash,categorias)
        product_parsed['foto'] = hash['rawIcon']
        product_parsed['nombre'] = ''

    # def parse_price
        price_parsed = hash['rawPrice'].split('$') #price_to_parse.split('$')
        price_parsed = price_parsed[1].split(' ')
        price_parsed = price_parsed[0].split(',')
        price_parsed[0] = price_parsed[0].to_i
        price_parsed[1] = price_parsed[1].to_i
        if price_parsed[1] > 50
            product_parsed['precio'] = ((price_parsed[0]).to_i + 1).to_s
        else
            product_parsed['precio'] = ((price_parsed[0]).to_i).to_s
        end
    # end
    
    # def parse_quantity
        producto_split = hash['rawTitle'].split(' ') 

        if (producto_split.include?('Grm'))
            product_parsed['cantidad'] = producto_split[producto_split.length-2] + 'Gr'
        else
            cantidad_to_compare = (producto_split[producto_split.length-2]).to_f
            if cantidad_to_compare > 7
                product_parsed['cantidad'] = ((cantidad_to_compare / 1000).to_s) + 'L'
            else
                product_parsed['cantidad'] = (cantidad_to_compare).to_s + 'L'
            end
        end
    # end

    # def parse_name
        producto_split.delete_at((producto_split.length) -2)
        producto_split.delete_at((producto_split.length) -1)
        producto_split.each do |element|
            product_parsed['nombre'] = product_parsed['nombre'] + element + ' '
        end
    # end
        puts product_parsed
    end
end

product_hash1 = {
    'rawTitle' => "Agua Mineralizada Artificialmente Cellier 500 L",
    'rawPrice' => precio[0].text,
    'rawIcon' => 'link'
}
product_hash2 = {
    'rawTitle' => "Energizante SPEED UNLIMITED 250 Cc", #Pack X 4 Unidades 250 Cc",
    'rawPrice' => precio[0].text,
    'rawIcon' => 'link'
}
product_hash3 = {
    'rawTitle' => "Chocolate Con Leche Y Almendras Vizzio Pot 165 Grm",
    'rawPrice' => precio[0].text,
    'rawIcon' => 'link'
}
product_hash4 = {
    'rawTitle' => "Te Frutos Del Bosque SAINT GOTTARD Caja 20 Saquitos",
    'rawPrice' => precio[0].text,
    'rawIcon' => 'link'
}
product_hash5 = {
    'rawTitle' => "Yerba Mate Hierbas Serranas Salus Paq 500 Grm",
    'rawPrice' => precio[0].text,
    'rawIcon' => 'link'
}
product_hash6 = {
    'rawTitle' => "Yerba Mate C/Hierb Aromaticas Cachamate Paq 1 Kgm",
    'rawPrice' => precio[0].text,
    'rawIcon' => 'link'
}
product_hash7 = {
    'rawTitle' => "Te SAINT GOTTARD Naranja Canela Y Anis Est 40 Grm",
    'rawPrice' => precio[0].text,
    'rawIcon' => 'link'
}

array_product_to_be_filtered = [product_hash1,product_hash2,product_hash3,product_hash4,product_hash5,product_hash6,product_hash7]
categorias = ['Agua', 'Agua Saborizada', 'Gaseosa','Bebida Isotónica', 'Energizante','Jugo','Chicles','Chocolate','Gomitas','Alfajor','Caramelos','Te','Cafe','Mate Cocido','Yerba']

filter_producto = Producto_terminado.new
array = filter_producto.filter_product(array_product_to_be_filtered, categorias) #POR PARAMETRO SOLAMENTE PASO DE A UN PRODUCTO A LA VEZ
parse(array,categorias)