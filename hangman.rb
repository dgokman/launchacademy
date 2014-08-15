#!/usr/bin/env ruby
require "pry"
puts "Welcome to Hangman!"


 words = ["store", "persist", "magical", "hounds", "thirsty", "astute"]
 letters = []
 chances = 8
 word = words.sample

 puts "Word: " + word
 puts "Chances remaining: #{chances}"
 puts "Guess a single letter (a-z) or the entire word:"
 guess = gets.chomp.downcase
 count = word.count(guess)

while chances > 1
 if word.include?(guess) == true
  chances -= 1
  letters << word
  puts "Word: " + word
  puts "Chances remaining: #{chances}"
  puts "Guess a single letter (a-z) or the entire word:"
  guess = gets.chomp.downcase
  puts "Found #{count} occurrence(s) of the character #{guess}"
 elsif word.include?(guess) == false
  chances -=1
  puts "Word: " + word
  puts "Chances remaining: #{chances}"
  puts "Guess a single letter (a-z) or the entire word:"
  guess = gets.chomp.downcase
  puts "Sorry, no #{guess}'s found."
 end
end






