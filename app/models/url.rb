class Url < ApplicationRecord
    def self.get_url_by_section(section)
        urls = self.all
        return urls.where("section = ?", section).url
    end
end
