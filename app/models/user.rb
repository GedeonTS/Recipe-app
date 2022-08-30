class User < ApplicationRecord
    has_many :food, foreign_key: 'user_id' :dependent => :delete_all
    has_many :recipe, foreign_key: 'user_id' :dependent => :delete_all
end