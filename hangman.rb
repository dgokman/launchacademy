#!/usr/bin/env ruby
require "pry"

def get_guess
  puts "Guess a single letter (a-z) or the entire word:"
  gets.chomp.downcase
end

puts "Welcome to Hangman!"


 words = ["store"]

 letters_hidden = []
 chances = 8
 word = words.sample
 letters = word.split("")
 # puts "Word: " + word
 # puts "Chances remaining: #{chances}"
 # puts "Guess a single letter (a-z) or the entire word:"
 guess = ""
 #count = ""
 #count = word.count(guess)

while chances > 0
 if letters.include?(guess) == true


    puts "Word: #{letters[-1]}" + "_" * (word.count(word) - 1)

    puts "Chances remaining: #{chances}"
    guess = get_guess
    puts "Found #{count} occurrence(s) of the character #{guess}"
    chances -= 1
  else
   puts "Word: " + "_"*word.count(word)

   puts "Chances remaining: #{chances}"
   guess = get_guess
   puts "Found #{count} occurrence(s) of the character #{guess}"
   chances -= 1
  end
 else
  puts "Word: " + "-"*word.count(word)
  puts "Chances remaining: #{chances}"
  puts "Guess a single letter (a-z) or the entire word:"
  guess = gets.chomp.downcase
  puts "Sorry, no #{guess}'s found."
  chances -=1
 end
end






