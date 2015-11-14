def get_guess(length)
  puts "The word is #{length} letters. Guess a single letter (a-z) or the entire word:"
  gets.chomp.downcase
end

def validate_play_again(play_again)
  if play_again == "y"
    @guesses = 5
    puts "Call me Hangman!"
    @invalid = false
  elsif play_again != "n"
    puts "Sorry, we didn't get that. Please choose Y or N"
    @invalid = true
  end
end

puts "Call me Hangman!"
words = File.read('mobydick1.txt').split(" ").delete_if {|x| x.split("").any? {|y| y !~ /[a-zA-Z]/} || x.length < 5}

play_again = ""
@guesses = 5
until play_again == "n"
  word = words.sample.downcase
  partial_word = "_" * word.length
  while @guesses >= 1
    guess = get_guess(word.length)
    if guess.length == 1 && word.include?(guess)
      partial_word = partial_word.split("").each_with_index.map {|x, i| guess == word[i] ? guess : x }.join
      @guesses -= 1
    elsif guess.length == 1 && !word.include?(guess)
      @guesses -= 1
    elsif guess.length > 1 && guess != word
      @guesses -= 1
    elsif guess.length == 0
      puts "Please guess a single letter or the entire word"
    elsif guess == word
      word = words.sample.downcase
      partial_word = "_" * word.length
      puts "Congrats, you guessed correctly! Play again? (Y/N):"
      play_again = gets.chomp.downcase
      validate_play_again(play_again)
    end
    puts partial_word
    puts "You have #{@guesses} guesses left" unless @guesses <= 0
  end
  puts "Sorry, the word was #{word}. Play again? (Y/N):" unless @invalid == true
  play_again = gets.chomp.downcase
  validate_play_again(play_again)
end









