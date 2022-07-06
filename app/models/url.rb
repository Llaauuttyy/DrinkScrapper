class Url < ApplicationRecord
    def self.get_url(section)
        urls = self.all
        return urls.where("section = ?", section)[0]["url"]
    end
end