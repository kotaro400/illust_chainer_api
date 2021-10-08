class Picture < ApplicationRecord
  include Rails.application.routes.url_helpers

  validates :order, uniqueness: true

  has_one_attached :image

  scope :ordered, -> { order(order: :desc) }

  def chained?
    last_picture = Picture.find_by(order: order - 1)
    last_letter = last_picture.name.split("").reverse.find {|i| !["ー", "ゃ", "ゅ", "ょ", "っ"].include?(i) }
    name.first == last_letter && name.last != "ん"
  end

  def image_url
    image.attached? ? url_for(image) : nil
  end
end
