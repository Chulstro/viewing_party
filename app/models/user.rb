class User < ApplicationRecord
  has_many :authorizations
  has_many :user_friends, class_name: 'Friend'
  has_many :friends, through: :user_friends, source: :friend

  def self.update_and_create(name, email)
    User.find_by(email: email) || User.create(name: name, email: email)
  end
end
