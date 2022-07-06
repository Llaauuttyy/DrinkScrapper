class ApplicationRecord < ActiveRecord::Base
  primary_abstract_class

  def self.erase_all
    # A forma de logger.
    puts "Eliminando todos los datos de la tabla..."

    self.delete_all
  end
end
