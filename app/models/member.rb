class Member < ApplicationRecord
  validates :name, presence: true
  validates :surname, presence: true
  validates :email, presence: true, format: { with: /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i }
  validates :birthday, presence: true
  validates :games_played, presence: true
  validates :current_rank, presence: true
end
