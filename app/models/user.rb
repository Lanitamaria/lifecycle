class User < ApplicationRecord
  # Include default devise modules. Others available are:
  after_initialize do
    if self.new_record?
      self.role ||= :guest
    end
  end
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :omniauthable, :omniauth_providers => [:linkedin, :google_outh2]

  enum role: [:guest, :candidate, :company, :admin]
end
