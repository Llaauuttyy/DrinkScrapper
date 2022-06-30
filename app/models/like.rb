class Like < ApplicationRecord
    def self.update_likes(params)
        likes = 1

        product = Like.find_by(plu: params[:plu])
        if product
            product.likes += 1
            product.save
        else
            Like.new(plu: params['plu'], likes: likes, category: params['category']).save
        end
        
    end
end
