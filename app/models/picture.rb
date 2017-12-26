class Picture < ApplicationRecord
	belongs_to :user
	has_many :comments, dependent: :destroy
	has_many :likes, dependent: :destroy
	validates :name, :description, :image , presence: true
	validate :picture_size
	mount_uploader :image, ImageUploader

	def picture_size
        if image.size > 10.megabytes
          errors.add(:picture, ".No no too big size! Should be less than 2MB")
        end
			end
	after_create do
		picture=Picture.find_by(id: self.id)
		end
	

	before_update do
		picture =Picture.find_by(id: self.id)
		picture.tags.clear
		
		hashtags.uniq.map do |hashtag|
			tag = Tag.find_or_create_by(name: hashtag.downcase.delete('#'))
			picture.tags << tag
		end
	end
	
end
