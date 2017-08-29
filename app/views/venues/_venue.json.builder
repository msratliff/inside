json.extract! venue, :name, :email, :password, :password_confirmation, :street, :city, :state, :zipcode, :search, :lat, :long, :created_at, :updated_at
json.url venue_url(venue, format: :json)
