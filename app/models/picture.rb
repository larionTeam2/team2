class Picture < ApplicationRecord
	belongs_to :user

	validates :name, :description, :image , presence: true

	mount_uploader :image, ImageUploader
end
