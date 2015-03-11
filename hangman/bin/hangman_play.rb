#!/usr/bin/env ruby

require_relative '../lib/hangman.rb'

puts "HANGMAN!!!"
print "Enter super secret word: "

secret_word = STDIN.gets.chomp

game = Game.new(secret_word)

until game.game_over? || game.win?
  print "Enter guess: "
  guess = STDIN.gets.chomp

  if guess.length == 1
    game.lguess(guess)
  elsif guess.length > 1
    game.wguess(guess)
  else
    puts "Please enter a valid guess"
  end
  puts game.progress
  puts "Lives remaining: #{game.lives}"
  puts "You Win!" if game.win?
  puts "This is why you fail" if game.game_over?
end

puts "Thanks for playing"
