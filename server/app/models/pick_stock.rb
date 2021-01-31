class PickStock < ApplicationRecord
  belongs_to :pick, optional: true
  has_one :pick
end