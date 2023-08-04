class User < ApplicationRecord
  validates :name, presence: true
  validates :email, presence: true
  validates :age, presence: true
  validates :gender, presence: true
end
