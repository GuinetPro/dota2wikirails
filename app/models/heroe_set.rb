class HeroeSet < ActiveRecord::Base
  belongs_to :heroe

  validates :title, presence:true, length: { minimum: 5}
  validates :description, presence:true , length: { minimum: 10}
  validates :heroe, presence:true
  validates :rarity, presence:true, length: { minimum: 3}
  validates :active, presence:true
  validates :cost, presence:true

end
