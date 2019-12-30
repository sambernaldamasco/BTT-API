class Team < ApplicationRecord
  has_many :users
  has_many :practices
  has_many :skaters
end
