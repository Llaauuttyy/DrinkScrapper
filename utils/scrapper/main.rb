require_relative "DrinkScrapper.rb"

DRINKS_PAGE_1 = "https://www.cotodigital3.com.ar/sitios/cdigi/browse/catalogo-bebidas-bebidas-sin-alcohol/_/N-j9f2pv"

DrinkScrapper.new.process_pages_from_url(DRINKS_PAGE_1)
