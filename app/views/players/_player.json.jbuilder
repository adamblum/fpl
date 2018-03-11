json.extract! player, :id, :first_name, :surname, :position, :team, :created_at, :updated_at
json.url player_url(player, format: :json)
