class Actor < ActiveRecord::Base
  validates :name, presence: true, uniqueness: true

  has_many :characters
  has_many :television_shows, through: :characters
end
