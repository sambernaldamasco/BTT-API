class Practice < ApplicationRecord
  belongs_to :team
  has_many :attendances
  has_many :skaters, through: :attendances
end
