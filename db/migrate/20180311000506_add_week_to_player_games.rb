class AddWeekToPlayerGames < ActiveRecord::Migration[5.1]
  def change
    add_column :player_games, :week, :integer
  end
end
