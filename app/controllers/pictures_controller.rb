class PicturesController < ApplicationController

  def index
    pictures = Picture.ordered
    render json: pictures, name: false
  end

  def create
    picture = Picture.new(picture_params)
    if picture.save
      pictures = Picture.ordered
      render json: pictures, name: true
    else
      render json: picture.errors
    end
  end

  private
  def picture_params
    params.permit(:name, :order, :image)
  end

end
