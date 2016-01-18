class Heroe < ActiveRecord::Base
  belongs_to :heroeattribute
  has_many :ability
  has_many :heroe_set
  has_many :attachment_set

  validates :name, presence:true, uniqueness: true
  validates :description, presence:true , length: { minimum: 20}

  validates :heroeattribute, presence: true

  has_attached_file :image,
            :path => ":rails_root/public/system/:attachment/heroe/:style/:filename",
            :url => "/system/:attachment/heroe/:style/:filename",
            styles: { medium: "300x300", thumb:"256x144", mini:"59x33" }

  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/

end
