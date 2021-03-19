class Cocktail < ApplicationRecord
  belongs_to :user 
  has_many :cocktail_ingredients
  has_many :ingredients, through: :cocktail_ingredients
  scope :by_title, -> {order(title: :asc)}
  accepts_nested_attributes_for :ingredients, :cocktail_ingredients, reject_if: :all_blank
  validates :title, :date_created, presence: true 
end
