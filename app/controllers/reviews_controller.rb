class ReviewsController < ApplicationController
  def index

  end

  # Este self permite decir que es un método de instancia.
  def self.get_reviews(plu)
    query = "plu = #{plu}"
    reviews = Review.where(query)
  end

  def upload
    #Cargo la review en la base.
    Review.new(plu: params["plu"], review: params["review"], reviewer_name: params["name"]).save
  end

  def prueba
    puts "ASASDDS"
  end

  def prueba1
    puts "asdasdasdaAAAAAAAAAAAAA"
  end
end

# rails generate model review plu:integer review:string reviewer_name:string