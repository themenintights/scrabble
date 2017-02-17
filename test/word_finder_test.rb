gem 'minitest'
require_relative '../lib/word_finder'
require 'minitest/autorun'
require 'minitest/pride'
require 'pry'

class WordFinderTest < Minitest::Test
	def test_find_words_with_letters
		finder = WordFinder.new
		assert_equal ["a", "ae", "aer", "aero", "ape", "aper", "apert", "apex"], finder.for_letters(['r', 'e', 'x', 'a', 'p', 't', 'o'])       # => ["a", "ae", "aer", "aero", "ape", "aper", "apert", "apex", ...
		assert_equal 141, finder.for_letters(['r', 'e', 'x', 'a', 'p', 't', 'o']).count # => 141
	end
end
