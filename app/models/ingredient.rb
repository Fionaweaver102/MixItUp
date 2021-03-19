class Ingredient < ApplicationRecord
  has_many :cocktail_ingredients
  has_many :cocktails, through: :cocktail_ingredients
  scope :by_name, -> {order(name: :asc)}
  validates :name, uniqueness: true 
end
