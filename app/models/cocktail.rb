class Cocktail < ApplicationRecord
  belongs_to :user 
  has_many :cocktail_ingredients
  has_many :ingredients, through: :cocktail_ingredients
  accepts_nested_attributes_for :ingredients
end
