class CreatePlayerGames < ActiveRecord::Migration[5.1]
  def change
    create_table :player_games do |t|
      t.integer :player_id
      t.string :position
      t.string :team
      t.integer :cost
      t.integer :point_last_round
      t.integer :total_points
      t.float :average_points
      t.integer :yellow_cards
      t.integer :transfers_out
      t.integer :yellow_cards
      t.integer :goals_scored
      t.integer :saves
      t.integer :value_season
      t.integer :transfers_out
      t.integer :price_rise
      t.integer :last_season_points
      t.integer :value_form
      t.integer :penalties_missed
      t.integer :form
      t.integer :bonus
      t.float :selected_by_percent
      t.integer :transfers_in
      t.integer :minutes_played
      t.integer :transfers_in_round
      t.integer :red_cards
      t.integer :bps
      t.float :forecast

      t.timestamps
    end
  end
end
