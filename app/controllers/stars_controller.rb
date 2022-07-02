class StarsController < ApplicationController
  def index
  end

  def self.get_stars
    stars_list = Star.all
  end

  def delete
    # Aplicar herencia en los delete.
    Star.delete(params[:id])

    redirect_to '/stars/index'
  end
end
