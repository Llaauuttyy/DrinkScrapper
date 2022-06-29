class ReviewsController < ApplicationController
  def index
  end

  def upload
    puts params
    puts "GOLAAAAAAAAAAAAAAAA SOY UAN REVIEWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWW\n\n\n\n AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA"
    Review.new(plu: params["plu"], review: params["review"], reviewer_name: params["name"]).save
  end
end

# rails generate model review plu:integer review:string reviewer_name:string