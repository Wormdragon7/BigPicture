class Scene < ApplicationRecord
  belongs_to :scenario
  validates :description, presence: true, uniqueness: true
end
