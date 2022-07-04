class Star < ApplicationRecord
    def self.add_product(product_plu)

        if !Star.find_by("plu = #{product_plu}")
            # Validar que lo agregue sólo si no está en la base.
            starred_product = Product.where("plu = #{product_plu}")[0]
            likes = Like.where("plu = #{product_plu}")[0].likes rescue 0

            Star.new(plu: starred_product['plu'], name: starred_product['name'], category: starred_product['category'], img_link: starred_product['img_link'], price: starred_product['price'], size: starred_product['size'], likes: likes).save
        end
    end
end
