class AddSeasonToPlayerGames < ActiveRecord::Migration[5.1]
  def change
    add_column :player_games, :season, :integer
  end
end
