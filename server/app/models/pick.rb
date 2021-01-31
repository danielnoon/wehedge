class Pick < ApplicationRecord
  belongs_to :initiator
  belongs_to :group_id
end
