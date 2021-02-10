Cocktail.destroy_all

puts "seeding database..."
CocktailApi::Adapter.get_cocktails
puts "done."