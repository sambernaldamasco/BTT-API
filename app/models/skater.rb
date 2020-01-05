class Skater < ApplicationRecord
  belongs_to :team
  has_one :skill
  has_many :attendances
  has_many :practices, through: :attendances

  # def skill_overview
  #   @all_skills = Skill.find_by(skater_id: self.id)
  #   @overview = {
  #     'good' => [],
  #     'ok' => [],
  #     'bad' => []
  #   }
  #
  #   test = @all_skills.each{|key, value| key.value if value > 2}
  #
  #
  #   return test
  # end
end
