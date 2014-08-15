#!/usr/bin/env ruby
require "pry"
puts "Welcome to Hangman!"


 words = ["store"]
 letters = []
 chances = 8
 word = words.sample

 # puts "Word: " + word
 # puts "Chances remaining: #{chances}"
 # puts "Guess a single letter (a-z) or the entire word:"
 guess = ""
 count = ""
 position = word.index(guess)

while chances > 0
 if word.include?(guess) == true
  letters << guess
  if letters[-1] == word[0]
    puts "Word: #{letters[-1]}" + "_" * (word.count(word) - 1)
    puts "Chances remaining: #{chances}"
    puts "Guess a single letter (a-z) or the entire word:"
    guess = gets.chomp.downcase
    count = word.count(guess)
    puts "Found #{count} occurrence(s) of the character #{guess}"
    chances -= 1
  else
   puts "Word: " + "_"*word.count(word)
   puts "Chances remaining: #{chances}"
   puts "Guess a single letter (a-z) or the entire word:"
   guess = gets.chomp.downcase
   count = word.count(guess)
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






