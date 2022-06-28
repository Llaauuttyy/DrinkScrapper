require_relative "SupermarketScrapper.rb"

# DRINKS_PAGE_1 = "https://www.cotodigital3.com.ar/sitios/cdigi/browse/catalogo-bebidas-bebidas-sin-alcohol/_/N-j9f2pv"
# DRINKS_PAGE_1 = "https://www.cotodigital3.com.ar/sitios/cdigi/browse/catalogo-almac%C3%A9n-infusiones/_/N-dw58vw"
# DRINKS_PAGE_1 = "https://www.cotodigital3.com.ar/sitios/cdigi/browse/catalogo-almac%C3%A9n-golosinas/_/N-1y5dh9i"
DRINKS_PAGE_1 = "https://www.cotodigital3.com.ar/sitios/cdigi/browse/catalogo-bebidas-bebidas-con-alcohol/_/N-4hulsc"

SupermarketScrapper.new.process_pages_from_url(DRINKS_PAGE_1)

