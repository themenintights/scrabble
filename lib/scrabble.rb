class Scrabble
  attr_reader :init_word

  def initialize(word = "")
    @init_word = word
  end

  def score(word = init_word)
    if !word.nil?
      word.upcase.chars.map do |letter|
      point_values[letter]
      end.reduce(:+)
    end
  end

  def point_values
    {
      "A"=>1, "B"=>3, "C"=>3, "D"=>2,
      "E"=>1, "F"=>4, "G"=>2, "H"=>4,
      "I"=>1, "J"=>8, "K"=>5, "L"=>1,
      "M"=>3, "N"=>1, "O"=>1, "P"=>3,
      "Q"=>10, "R"=>1, "S"=>1, "T"=>1,
      "U"=>1, "V"=>4, "W"=>4, "X"=>8,
      "Y"=>4, "Z"=>10
    }
  end

  def score_with_multipliers(word, multi_letter, multi_word = "1")
    if word.length == 7 
      (score_each_letter(word, multi_letter).reduce(:+)+ 10) * multi_word.to_i
    else
      score_each_letter(word, multi_letter).reduce(:+) * multi_word.to_i
    end
  end

  def turn_into_scores(word)
    word_array = word.split("")
    word_array.map do |letter|
      score(letter)
    end
  end

  def score_each_letter(word, multi_letter)
    turn_into_scores(word).zip(multi_letter).map do |pair|
      pair.reduce(:*)
    end
  end

  def highest_scoring_word(words)
    highest = []
    words.map do |word|
      if score(highest[0]).nil?
        highest << word
      elsif score(highest[-1]) < score(word)
        highest << word
      elsif score(highest[-1]) == score(word) and word.length < highest[-1].length
        highest << word
      elsif score(highest[-1]) <= score(word) and word.length == 7
        highest << word
      end
    end
    highest[-1]
  end
end
