class AddPointsLastRoundToPlayerGames < ActiveRecord::Migration[5.1]
  def change
    add_column :player_games, :points_last_round, :integer
  end
end
