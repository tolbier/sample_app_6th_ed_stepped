class User < ApplicationRecord
  validates :name, presence: true
  validates :email, presence: true
  #or validates(:name, presence: true)
end
