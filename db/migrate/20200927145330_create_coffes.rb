class CreateCoffes < ActiveRecord::Migration[6.0]
  def change
    create_table :coffes do |t|
      t.string :name
      t.integer :articlenbr
      t.integer :price
      t.string :description

      t.timestamps
    end
  end
end
