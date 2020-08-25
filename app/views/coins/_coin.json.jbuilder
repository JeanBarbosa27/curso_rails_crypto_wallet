json.extract! coin, :id, :coin_name, :acronym, :image_url, :created_at, :updated_at
json.url coin_url(coin, format: :json)
