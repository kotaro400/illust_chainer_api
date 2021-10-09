class Picture < ApplicationRecord
  include Rails.application.routes.url_helpers

  validates :order, uniqueness: { scope: :chain_id }
  validate :only_last_chain, :must_be_sequenced_order, on: :create

  has_one_attached :image
  belongs_to :chain

  scope :ordered, -> { order(order: :desc) }

  def chained?
    last_picture = Picture.find_by(order: order - 1)
    last_letter = last_picture.name.split("").reverse.find {|i| !["ー", "ゃ", "ゅ", "ょ", "っ"].include?(i) }
    name.first == last_letter && name.last != "ん"
  end

  def image_url
    image.attached? ? url_for(image) : nil
  end

  private
  def only_last_chain
    if chain.id != Chain.last.id
      errors.add(:base, "そのしりとりはすでに終了しています")
    end
  end

  def must_be_sequenced_order
    max_order = chain.pictures.select {|picture| picture.persisted? }.map {|picture| picture.order }.max
    max_order = max_order ? max_order : 0
    if max_order + 1 != order
      errors.add(:base, "すでに誰かが回答済みです")
    end
  end
end
