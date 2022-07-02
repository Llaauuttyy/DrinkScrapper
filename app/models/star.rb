class Star < ApplicationRecord
    def self.add_product(product_plu)
        starred_product = Product.where("plu = #{product_plu}")[0]
        # Validar que lo agregue sólo si no está en la base.
        Star.new(plu: starred_product['plu'], name: starred_product['name'], category: starred_product['category'], img_link: starred_product['img_link'], price: starred_product['price'], size: starred_product['size'], likes: 1).save
    end

end
