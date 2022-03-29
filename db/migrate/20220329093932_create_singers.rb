class CreateSingers < ActiveRecord::Migration[6.1]
  def change
    create_table :singers do |t|
      t.string :name
      t.string :category
      t.integer :price
      t.references :user, null: false, foreign_key: true
      t.integer :death_year
      t.integer :birth_year
      t.text :bio

      t.timestamps
    end
  end
end
