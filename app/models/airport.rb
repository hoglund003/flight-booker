class Airport < ApplicationRecord
  validates :airport_code, uniqueness: true, presence: true
end
