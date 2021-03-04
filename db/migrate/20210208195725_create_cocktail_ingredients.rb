class CreateCocktailIngredients < ActiveRecord::Migration[6.1]
  def change
    create_table :cocktail_ingredients do |t|
      t.string :amount
      t.integer :cocktail_id 
      t.integer :ingredient_id

      t.timestamps
    end
  end
end
