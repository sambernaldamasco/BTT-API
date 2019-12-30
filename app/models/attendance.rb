class Attendance < ApplicationRecord
  belongs_to :practice
  belongs_to :skater
end
