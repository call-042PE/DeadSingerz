class CreateSingers < ActiveRecord::Migration[6.1]
  def change
    create_table :singers do |t|
      t.string :name
      t.string :category
      t.integer :price
      t.text :bio
      t.integer :death_year
      t.integer :birth_year
      t.references :user, null: false, foreign_key: true
      t.references :booking, null: false, foreign_key: true

      t.timestamps
    end
  end
end
