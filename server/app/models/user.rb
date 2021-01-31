class User < ApplicationRecord
    has_and_belongs_to_many :groups
    has_many :picks
    has_many :pick_stocks, through: :picks
end
