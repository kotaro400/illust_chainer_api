class Chain < ApplicationRecord
  has_many :pictures

  def self.last
    order(updated_at: :desc).limit(1)[0]
  end
end
