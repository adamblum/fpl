class AddTransfersOutRoundToPlayerGames < ActiveRecord::Migration[5.1]
  def change
    add_column :player_games, :transfers_out_round, :integer
  end
end
