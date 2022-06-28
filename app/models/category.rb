class Category < ApplicationRecord
    def self.get_filter_categories(section_name)
        categories = Category.all

        filter_categories = []

        categories.where("section = ?", section_name).each {
            |category_row|
    
            filter_categories << category_row['category']
        }

        puts filter_categories
        return filter_categories
    end
end
