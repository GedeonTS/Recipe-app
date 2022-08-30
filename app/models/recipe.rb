class Recipe < ApplicationRecord
    has_many :recipe_food, foreign_key: 'recipe_food_id' :dependent => :delete_all
    belongs_to :recipe, foreign_key: 'user_id'
end

