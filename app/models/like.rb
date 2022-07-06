class Like < ApplicationRecord
    def self.update_likes(params)
        likes = 1

        product = Like.find_by(plu: params[:plu])
        if product
            product.likes += 1
            product.save

            # Lo actualizo en la de favoritos si está
            star_product = Star.find_by(plu: params[:plu])
            if star_product
                star_product.likes += 1
                star_product.save
            end

        else
            Like.new(plu: params['plu'], likes: likes, category: params['category']).save
        end
        
    end
end
