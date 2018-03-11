class CreatePlayers < ActiveRecord::Migration[5.1]
  def change
    create_table :players do |t|
      t.string :first_name
      t.string :surname
      t.string :position
      t.string :team

      t.timestamps
    end
  end
end
