class Character < ActiveRecord::Base
  validates :character_name, presence: true, uniqueness: {scope: :television_show}
  validates :actor_id, presence: true
  validates :television_show_id, presence: true

  belongs_to :television_show
  belongs_to :actor
end
