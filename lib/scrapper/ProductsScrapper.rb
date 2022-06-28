require "nokogiri"

PRICES_XPATH = "//span[@class='atg_store_productPrice'][not(contains(@style, 'visibility: hidden'))] | //div[@class='first_price_discount_container']/span[@class='price_discount']"
TITLES_XPATH = "//div[@class='descrip_full']"
ICONS_XPATH = "//span[@class='atg_store_productImage']/img"

class ProductsScrapper
    def scrap(page_to_scrap, xpaths)
        return [scrap_titles(page_to_scrap, xpaths), scrap_prices(page_to_scrap, xpaths), scrap_icons(page_to_scrap, xpaths)]
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
end