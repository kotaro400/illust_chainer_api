class PicturesController < ApplicationController

  def index
    pictures = Chain.last.pictures.ordered
    render json: pictures, name: false
  end

  def create
    chain = Chain.find_by(id: params[:chain_id])
    picture = chain.pictures.build(picture_params)
    if picture.save
      pictures = chain.pictures.ordered
      if picture.chained?
        render json: pictures, name: true, meta: { chained: true }
      else
        new_chain = Chain.create()
        picture = new_chain.pictures.create(name: "りんご", order: 1)
        picture.image.attach(io: File.open("#{Rails.root}/tmp/apple.PNG"), filename: "apple.png", content_type: "image/png")
        render json: pictures, name: true, meta: { chained: false }
      end
    else
      render json: picture.errors, status: 400
    end
  end

  private
  def picture_params
    params.permit(:name, :order, :image)
  end

end
