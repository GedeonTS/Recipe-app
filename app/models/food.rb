class RecipeFood < ApplicationRecord
    belongs_to :user, foreign_key: 'user_id'
    has_many :recipe_food, foreign_key: 'recipe_food_id' :dependent => :delete_all
end