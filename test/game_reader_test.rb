gem 'minitest'
require_relative '../lib/game_reader'
require 'minitest/autorun'
require 'minitest/pride'
require 'pry'

class GameReaderTest < Minitest::Test
	def test_can_check_csv_file
		game = GameReader.new('./test/input.csv')
		assert_equal 3, game.word_count(:player_1)
		assert_equal 2, game.word_count(:player_2)
		assert_equal 23, game.score(:player_1)
		assert_equal 18, game.score(:player_2)
	end
end
