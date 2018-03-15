class AddActualToPlayerGames < ActiveRecord::Migration[5.1]
  def change
    add_column :player_games, :actual, :float
  end
end
