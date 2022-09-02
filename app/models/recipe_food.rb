class RecipeFood < ApplicationRecord
  belongs_to :food, foreign_key: 'food_id'
  belongs_to :recipe, foreign_key: 'recipe_id'

  # validates :food_id, presence: true
  # validates :recipe_id, presence: true
end
