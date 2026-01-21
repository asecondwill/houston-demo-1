class CreateBoats < ActiveRecord::Migration[8.1]
  def change
    create_table :boats do |t|
      t.string :name
      t.text :description
      t.integer :length

      t.timestamps
    end
  end
end
