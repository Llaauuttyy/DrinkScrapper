require "nokogiri"

XPATH_PLU = "//span[@class='span_codigoplu']"

class ProductsScrapper
    def scrap(page_to_scrap, xpaths)
        return [scrap_titles(page_to_scrap, xpaths), scrap_prices(page_to_scrap, xpaths), scrap_icons(page_to_scrap, xpaths), scrap_plus(page_to_scrap)]
    end

    # Unificar en 1
    def scrap_prices(page_to_scrap, xpaths)
        prices = page_to_scrap.xpath(xpaths[0])
    end

    def scrap_titles(page_to_scrap, xpaths)
        titles = page_to_scrap.xpath(xpaths[1])
    end

    def scrap_icons(page_to_scrap, xpaths)
        icons = page_to_scrap.xpath(xpaths[2])
    end

    def scrap_plus(page_to_scrap)
        plu = page_to_scrap.xpath(XPATH_PLU)
    end
end