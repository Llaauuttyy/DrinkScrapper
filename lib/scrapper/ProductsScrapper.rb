require "nokogiri"

PRICES_XPATH = "//span[@class='atg_store_productPrice'][not(contains(@style, 'visibility: hidden'))] | //div[@class='first_price_discount_container']/span[@class='price_discount']"
TITLES_XPATH = "//div[@class='descrip_full']"
ICONS_XPATH = "//span[@class='atg_store_productImage']/img"

class ProductsScrapper
    def scrap(page_to_scrap)
        return [scrap_titles(page_to_scrap), scrap_prices(page_to_scrap), scrap_icons(page_to_scrap)]
    end

    # Unificar en 1
    def scrap_titles(page_to_scrap)
        titles = page_to_scrap.xpath(TITLES_XPATH)
    end

    def scrap_prices(page_to_scrap)
        prices = page_to_scrap.xpath(PRICES_XPATH)
    end

    def scrap_icons(page_to_scrap)
        icons = page_to_scrap.xpath(ICONS_XPATH)
    end
end