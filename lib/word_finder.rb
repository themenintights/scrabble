class WordFinder
  def words
    File.read('/usr/share/dict/words').split("\n")
  end
  
  def for_letters(letters)
    # binding.pry
    woding = []
    words.each do |word|
      letters.each do |letter|
        if word.include?(letters)
          woding << word
        end
      end
    end
    File.write("./lib/new_text.txt", woding)
  end
end
