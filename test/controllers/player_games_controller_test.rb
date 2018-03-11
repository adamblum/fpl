require 'test_helper'

class PlayerGamesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @player_game = player_games(:one)
  end

  test "should get index" do
    get player_games_url
    assert_response :success
  end

  test "should get new" do
    get new_player_game_url
    assert_response :success
  end

  test "should create player_game" do
    assert_difference('PlayerGame.count') do
      post player_games_url, params: { player_game: { average_points: @player_game.average_points, bonus: @player_game.bonus, bps: @player_game.bps, cost: @player_game.cost, forecast: @player_game.forecast, form: @player_game.form, goals_scored: @player_game.goals_scored, last_season_points: @player_game.last_season_points, minutes_played: @player_game.minutes_played, penalties_missed: @player_game.penalties_missed, player_id: @player_game.player_id, point_last_round: @player_game.point_last_round, position: @player_game.position, price_rise: @player_game.price_rise, red_cards: @player_game.red_cards, saves: @player_game.saves, selected_by_percent: @player_game.selected_by_percent, team: @player_game.team, total_points: @player_game.total_points, transfers_in: @player_game.transfers_in, transfers_in_round: @player_game.transfers_in_round, transfers_out: @player_game.transfers_out, transfers_out: @player_game.transfers_out, value_form: @player_game.value_form, value_season: @player_game.value_season, yellow_cards: @player_game.yellow_cards, yellow_cards: @player_game.yellow_cards } }
    end

    assert_redirected_to player_game_url(PlayerGame.last)
  end

  test "should show player_game" do
    get player_game_url(@player_game)
    assert_response :success
  end

  test "should get edit" do
    get edit_player_game_url(@player_game)
    assert_response :success
  end

  test "should update player_game" do
    patch player_game_url(@player_game), params: { player_game: { average_points: @player_game.average_points, bonus: @player_game.bonus, bps: @player_game.bps, cost: @player_game.cost, forecast: @player_game.forecast, form: @player_game.form, goals_scored: @player_game.goals_scored, last_season_points: @player_game.last_season_points, minutes_played: @player_game.minutes_played, penalties_missed: @player_game.penalties_missed, player_id: @player_game.player_id, point_last_round: @player_game.point_last_round, position: @player_game.position, price_rise: @player_game.price_rise, red_cards: @player_game.red_cards, saves: @player_game.saves, selected_by_percent: @player_game.selected_by_percent, team: @player_game.team, total_points: @player_game.total_points, transfers_in: @player_game.transfers_in, transfers_in_round: @player_game.transfers_in_round, transfers_out: @player_game.transfers_out, transfers_out: @player_game.transfers_out, value_form: @player_game.value_form, value_season: @player_game.value_season, yellow_cards: @player_game.yellow_cards, yellow_cards: @player_game.yellow_cards } }
    assert_redirected_to player_game_url(@player_game)
  end

  test "should destroy player_game" do
    assert_difference('PlayerGame.count', -1) do
      delete player_game_url(@player_game)
    end

    assert_redirected_to player_games_url
  end
end
