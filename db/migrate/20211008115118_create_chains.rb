class CreateChains < ActiveRecord::Migration[6.0]
  def change
    create_table :chains do |t|
      t.timestamps
    end
  end
end
