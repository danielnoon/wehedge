class Pick < ApplicationRecord
  has_one :user
  has_one :group
  has_many :pick_stocks
end
