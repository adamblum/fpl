require 'csv'

desc "Import player games from CSVs"
task :import => :environment do
  Dir.glob('./*.csv').select do |item|
    next if item == '.' or item == '..'
    p "File #{item}"
    week=item[-2..-1].to_i  # grab the week from the last two characters
    season=item[3..4].to_i # 4th and 5th characters have the season
    CSV.foreach(item,:headers=>true) do |row|
      player=Player.find_or_create_by(first_name: row["FirstName"],surname: row["Surname"])
      p "Player #{player.surname}"
      player.position=row["PositionsList"]
      player.team=row["Team"]
      player.save
      pg=PlayerGame.find_or_create_by(player_id: player.id,week: week, season: season)
      p "Player game #{player.id}:#{week}"
      pg.position=row["PositionsList"]
      pg.team=row["Team"]
      pg.cost=row["Cost"].to_i/1000
      pg.point_last_round=row["PointsLastRound"]
      pg.total_points = row["TotalPoints"]
      pg.average_points = row["AveragePoints"]
      pg.yellow_cards = row["YellowCards"]
      pg.transfers_out = row["TransferOut"]
      pg.price_rise = row["PriceRise"]
      pg.last_season_points = row["LastSeasonPoints"]
      pg.value_form = row["ValueForm"]
      pg.penalties_missed = row["PenaltiesMissed"]
      pg.form = row["Form"]
      pg.bonus = row["Bonus"]
      pg.selected_by_percent = row["SelectedByPercent"]
      pg.transfers_in = row["TransfersIn"]
      pg.minutes_played = row["MinutesPlayed"]
      pg.transfers_in_round = row["TransfersInRound"]
      pg.red_cards = row["RedCards"]
      pg.bps = row["BPS"]
      pg.save
    end
  end
end
