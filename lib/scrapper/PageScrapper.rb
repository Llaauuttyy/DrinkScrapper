require "mechanize"
require "nokogiri"

COTO_BASE_URL = "https://www.cotodigital3.com.ar"
NEXT_PAGE_XPATH =  "(//div[@class='pag_bottom']//a[contains(@title, 'página')][not(contains(@class, 'disabled'))])"

class PageScrapper
    def initialize
        @mechanize = Mechanize.new
    end

    def start_page(page_url)
        # begin
        page = @mechanize.get(page_url)
        # rescue
    end

    def get_next_page(page_get_next, next_page_number)
        next_pages = page_get_next.xpath(NEXT_PAGE_XPATH)
    
        next_pages_counter = 0
        next_page_found = false

        while (next_pages_counter < next_pages.length) && !next_page_found
            if next_pages.at(next_pages_counter).text == (next_page_number).to_s
                puts "EL link de la pagina numero #{next_page_number} es: "
                
                next_page = self.get_next_page_started(next_pages.at(next_pages_counter))
                next_page_found = true
            end

            next_pages_counter += 1
        end

        return next_page
    end

    def get_next_page_started(next_page_element)
        next_page_url = COTO_BASE_URL + next_page_element['href']

        puts "#{next_page_url}"

        next_page = self.start_page(next_page_url)

        return next_page
    end
end