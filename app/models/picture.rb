class Picture < ApplicationRecord
	belongs_to :user
	has_many :comments, dependent: :destroy
	validates :name, :description, :image , presence: true

	mount_uploader :image, ImageUploader
	
end
