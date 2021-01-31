class Vote < ApplicationRecord
  belongs_to :user
  belongs_to :pick

  validates :count, numericality: { greater_than: 0 }
end

