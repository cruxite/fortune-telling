class Fortune < ApplicationRecord
  validates :text, presence: true
end
