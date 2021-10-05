class CreatePictures < ActiveRecord::Migration[6.0]
  def change
    create_table :pictures do |t|
      t.integer :order, null: false
      t.string :name, null: false
      t.timestamps
    end
  end
end
