class Skill < ApplicationRecord
  has_many :skills_users
  has_many :users, through: :skills_users
end
