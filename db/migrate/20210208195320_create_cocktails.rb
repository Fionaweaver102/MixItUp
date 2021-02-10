class CreateCocktails < ActiveRecord::Migration[6.1]
  def change
    create_table :cocktails do |t|
      t.string :title
      t.string :image
      t.string :created_by
      t.date :date_created
      t.integer :user_id

      t.timestamps
    end
  end
end
