class Scenario < ApplicationRecord
    belongs_to :user
    has_many :scenes, dependent: :destroy
end
