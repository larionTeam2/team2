class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable ,
         :omniauthable, omniauth_providers: [:facebook, :google_oauth2]         


has_many :pictures , dependent: :destroy
has_one :profile , dependent: :destroy


def self.new_with_session (params, session)
  super.tap do |user|
    if data = session["devise.facebook_data"] &&
      session["devise.facebook_data"]["extra"]["raw_info"]
      user.email = data["email"] if user.email.blank?
    end
  end
end

def self.from_omniauth(auth)
  where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
    user.provider = auth.provider
    user.uid = auth.uid
    user.email = auth.info.email
    user.password = Devise.friendly_token[0,20]
  end
end


private

  def avatar_size_validation
    errors[:avatar] << "should be less than 5MB" if avatar.size > 3.megabytes
  end

end
