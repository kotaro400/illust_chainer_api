class AddReferenceToPictures < ActiveRecord::Migration[6.0]
  def change
    add_reference :pictures, :chain, foreign_key: true
  end
end
