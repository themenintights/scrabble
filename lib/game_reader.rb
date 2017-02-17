require'csv'
require'erb'

class GameReader
	attr_reader :contents

	def initialize(file)
		@contents = CSV.open file, headers: true, header_converters: :symbol
	end

	def word_count(player)

		contents.each do |row|
				row[player]
		end
		binding.pry
	end

	def score(player)

	end
end