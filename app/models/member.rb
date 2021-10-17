class Member < ApplicationRecord
  validates :name, presence: true
  validates :surname, presence: true
  validates :email, presence: true, format: { with: /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i }, uniqueness: true
  validates :birthday, presence: true
  validates :games_played, presence: true
  validates :current_rank, presence: true

  def full_name_and_rank
    "#{self.name} #{self.surname} ( Rank: #{self.current_rank} )"
  end

  def full_name
    "#{self.name} #{self.surname}"
  end
end