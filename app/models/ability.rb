class Ability < ActiveRecord::Base
  belongs_to :heroe

  validates :name, presence:true, uniqueness: true, length: { minimum: 5}

  validates :description, presence:true , length: { minimum: 5}

  validates :heroe, presence: true

  has_attached_file :image,
            :path => ":rails_root/public/system/:attachment/ability/:style/:filename",
            :url => "/system/:attachment/ability/:style/:filename",
            :default_url => "/images/missing.png",
            styles: { medium: "300x300", thumb:"256x144", mini:"59x33" }

  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/

end
