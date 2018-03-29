require 'csv'

desc "Import player games from CSVs"
task :import => :environment do
  Dir.glob('./*.csv').select do |file|
    next if file == '.' or file == '..'
    p "File #{file}"
    file =~ /FPL(\d+)-GW(\d+)/  # grab the week from the last two characters
    season=$1.to_i # 4th and 5th characters have the season
    p "Season #{season}"
    week = $2.to_i
    p "Week #{week}"
    CSV.foreach(file,:headers=>true) do |row|
      player=Player.find_or_create_by(first_name: row["FirstName"],surname: row["Surname"])
      p "Player #{player.surname} #{player.id}"
      player.position=row["PositionsList"]
      player.team=row["Team"]
      player.save
      pg=PlayerGame.find_or_create_by(player_id: player.id,week: week, season: season)
      p "Player game #{player.id}:#{week}"
      pg.week=week
      pg.season=season
      pg.position=row["PositionsList"]
      pg.team=row["Team"]
      pg.cost=row["Cost"].to_i/1000
      pg.points_last_round=row["PointsLastRound"]
      pg.total_points = row["TotalPoints"]
      pg.average_points = row["AveragePoints"]
      pg.yellow_cards = row["YellowCards"]
      pg.transfers_out_round = row["TransfersOutRound"]
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
      pg.forecast = row["GW#{week+1}Forecast"]
      pg.save
    end
  end
end

task :actuals => :environment do
  PlayerGame.find_each do |pg|
    p "Putting actuals on #{pg.inspect}"
    begin
      p "Searching for player game #{pg.player_id},#{pg.week+1},#{pg.season}"
      next_game = PlayerGame.where("player_id=? and week=? and season=?",pg.player_id,pg.week+1,pg.season).first
    rescue
      next_game = nil
    end
    p "Next game #{next_game.inspect}"
    if next_game
      p "Set actual to #{next_game.point_last_round}"
      pg.actual = next_game.point_last_round
    end
    pg.save
  end
end

task :makecsv => :environment do
  cols=["Id","PlayerId","Week","Season","Position","Team","Cost","PointsLastRound","YellowCards","TransfersOutRound","PriceRise","ValueForm","Form","Bonus","SelectedByPercent","MinutesPlayed","TransfersInRound"]
  CSV.open("fpl.csv", "w") do |csv|
    csv << cols
    PlayerGame.find_each do |pg|
      values_cmd="csv << ["
      cols.each do |col|
        values_cmd << "pg.#{col},"
      end
      values_cmd = values_cmd[0...-1]
      values_cmd << "]"
      values_cmd=values_cmd.underscore
      p "Executing #{values_cmd}"
      eval values_cmd
    end
  end
end
