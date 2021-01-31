class Group < ApplicationRecord
  has_and_belongs_to_many :tags
  has_and_belongs_to_many :users
  has_many :picks
end
