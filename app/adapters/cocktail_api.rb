module CocktailApi

  class Adapter

    URL = "https://www.thecocktaildb.com/api/json/v2/9973533/popular.php"

    def self.get_cocktails
      cocktails = JSON.parse(RestClient.get(URL))
 
      cocktails['drinks'].each do |cocktail|
        arr = []
        @cocktail = Cocktail.create!(
        title: cocktail['strDrink'],
        image: cocktail['strDrinkThumb'],
        date_created: cocktail['dateModified']
        )

        cocktail.each do |key, value|
          if key.include? "Ingredient"
           arr << value
          end 
        end 

        arr.compact.each.with_index(1) do |ingredient, index|

          @ingredient = Ingredient.find_or_create_by(
            name: ingredient
          )
            CocktailIngredient.create!(
            amount: cocktail["strMeasure#{index}"],
            cocktail_id: @cocktail.id, 
            ingredient_id: @ingredient.id
          )
        end 

      end 
  
    end 
  
  end 

end 