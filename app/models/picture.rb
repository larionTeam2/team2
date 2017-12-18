class Picture < ApplicationRecord
	belongs_to :user
	has_many :comments, dependent: :destroy
	validates :name, :description, :image , presence: true

	mount_uploader :image, ImageUploader

	def self.search(term)
		if term 
			where('name LIKE ?', "%#{term}#").order(:name)
		else 
			order(:name)
		end 
	end 
end
