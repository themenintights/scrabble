require_relative'scrabble'

class WordList
	attr_reader :list
	def initialize
		@list = []
	end

	def add(word)
		list << word
	end

	def count
		list.count
	end

	def head
		Scrabble.new(list.last)
	end

	def total_score
		if list.empty?
			0
		else
			total_s = list.map do |word|
				head.score(word)
			end
			total_s.reduce(:+)
		end
	end
end
