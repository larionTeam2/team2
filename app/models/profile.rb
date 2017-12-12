class Profile < ApplicationRecord
	belongs_to :user

	validates :name, :image, :phone, presence: true

	mount_uploader :image, ImageUploader
end
