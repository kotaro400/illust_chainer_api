class PictureSerializer < ActiveModel::Serializer
  attributes :id, :order, :image_url
  attribute :name, if: -> { instance_options[:name] }

  def image_url
    object.image_url
  end
end
