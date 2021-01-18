class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         #:omniauthable, :omniauth_providers => [:linkedin, :google_outh2]

  enum role: [:company, :candidate]

end
