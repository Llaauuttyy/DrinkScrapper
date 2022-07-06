class ReviewsController < ApplicationController
  def index

  end

  # Este self permite decir que es un método de instancia.
  def self.get_reviews(plu)
    query = "plu = #{plu}"
    reviews = Review.where(query)
  end

  def upload
    # Cargo la review en la base.
    Review.new(plu: params["plu"], review: params["review"], reviewer_name: params["name"]).save

    # Renderizo la view para observar cambios.
    render "/reviews/index"
  end

  def delete
    puts params

    Review.delete(params[:id])

    redirect_to "/reviews/index/#{params[:plu]}"
  end
end

# rails generate model review plu:integer review:string reviewer_name:string