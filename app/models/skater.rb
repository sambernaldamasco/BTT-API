class Skater < ApplicationRecord
  belongs_to :team
  has_one :skill
  has_many :attendances
  has_many :practices, through: :attendances
end
