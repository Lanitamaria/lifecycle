class Candidate < User
    has_many :skills, through: :skills_users, dependent: :destroy
    has_many :skills_users
end
