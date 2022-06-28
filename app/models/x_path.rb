class XPath < ApplicationRecord
    def self.get_xpaths(section_name)
        xpaths = XPath.all

        xpaths_array = []

        xpaths.where("section = ?", section_name).each {
            |xpaths|
    
            xpaths_array << xpaths['xpath']
        }

        puts xpaths_array
        return xpaths_array
    end
end
