json.extract! adress, :id, :user_id, :street_number, :street_name, :zipcode, :city, :country, :created_at, :updated_at
json.url adress_url(adress, format: :json)
