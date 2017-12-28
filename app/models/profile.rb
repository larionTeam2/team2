class Profile < ApplicationRecord
	belongs_to :user
	#before_filter :authenticate_user!
	validates :name, :image, :phone, presence: true

	mount_uploader :image, ImageUploader
end
