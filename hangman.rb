def get_guess(length)
  puts "The word is #{length} letters. Guess a single letter (a-z) or the entire word:"
  gets.chomp.downcase
end

puts "Welcome to Hangman!"

words = File.read('mobydick1.txt').split(" ").delete_if {|x| x.split("").any? {|y| y !~ /[a-zA-Z]/} || x.length < 5}

word = words.sample
partial_word = "_" * word.length
guesses = 5
while guesses >= 0
  guess = get_guess(word.length)
  if guess.length == 1 && word.include?(guess)
    partial_word = partial_word.split("").each_with_index.map {|x, i| guess == word[i] ? guess : x }.join
  elsif guess == word
    puts "Congrats, you guessed correctly!"
    break
  end
  puts partial_word
  puts "You have #{guesses} guesses left"
  guesses -= 1
end

puts "Sorry, the word was #{word}"







