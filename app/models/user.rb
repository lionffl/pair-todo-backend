class User < ApplicationRecord
  has_secure_password
  validates_presence_of :username, :password, :secret_question, :secret_answer
  validates_uniqueness_of :username
  has_many :tasks
end
