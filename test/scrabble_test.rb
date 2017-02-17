gem 'minitest'
require_relative '../lib/scrabble'
require 'minitest/autorun'
require 'minitest/emoji'
require 'pry'

class ScrabbleTest < Minitest::Test
  def test_it_can_score_a_single_letter
    assert_equal 1, Scrabble.new.score("a")
    assert_equal 4, Scrabble.new.score("f")
  end

  def test_score_with_multipliers
    game = Scrabble.new
    assert_equal 9, game.score_with_multipliers('hello', [1,2,1,1,1])
  end

  def test_can_have_full_word_multiplied
    game = Scrabble.new
    game.score_with_multipliers('hello', [1,2,1,1,1], 2)
    assert_equal 18, game.score_with_multipliers('hello', [1,2,1,1,1], 2)
  end

  def test_can_add_ten_if_seven_letter_word
    game = Scrabble.new
    assert_equal 58, game.score_with_multipliers('sparkle', [1,2,1,3,1,2,1], 2)
  end

  def test_highest_scoring_word
  game = Scrabble.new
  assert_equal "home", game.highest_scoring_word(['home', 'word', 'hello', 'sound'])
  end

  def test_highest_scoring_word_less_letters
    game = Scrabble.new
    assert_equal "word", game.highest_scoring_word(['hello', 'word', 'sound'])
  end

  def test_highest_scoring_word_but_seven_letters
    game = Scrabble.new
    assert_equal "silence", game.highest_scoring_word(['home', 'word', 'silence'])
  end

  def test_chooses_first_if_same_length
    game = Scrabble.new
    assert_equal "word", game.highest_scoring_word(['hi', 'word', 'ward'])
  end
end
