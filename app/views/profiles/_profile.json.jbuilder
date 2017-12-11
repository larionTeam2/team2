json.extract! profile, :id, :name, :image, :age, :address, :phone, :about, :created_at, :updated_at
json.url profile_url(profile, format: :json)
