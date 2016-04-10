require '/Users/hayshopkins/Desktop/ruby_projects/card_games/Cards.rb'
require '/Users/hayshopkins/Desktop/ruby_projects/card_games/texas_holdem/Player.rb'
require '/Users/hayshopkins/Desktop/ruby_projects/card_games/texas_holdem/Computer.rb'
require 'net/http'

class TexasHoldemDealer
	include Cards

	attr_accessor :deck, :table, :players, :pot
	
	def initialize(table, players)
		@table = table
		@players = players
		@ante_queue = players
		@pot = 0
	end

	def play_game
		@deck = build_deck(52)
		#HOW DO I KEEP TRACK OF WHOSE TURN IT IS TO ANTE?
		#Use an array of players like a queue
		#ante
	end

	def hole_cards

		player_cards = deal(2, 4, [])
		puts player_cards
		deal_to_players(player_cards)
		display_cards
		#bet
	end

	def the_flop
		deal(3, 1, table)
		display_cards
		#bet
	end

	def the_turn
		#put 1 card on the table
		deal(1, 1, table)
		display_cards
		#bet
	end

	def the_river
		deal(1, 1, table)
		display_cards
		#final bet
		#determine_winner
	end

	def deal(num_of_cards, num_of_deals, location)
		
		(1..num_of_deals).each do
			card_one, card_two, card_three = deck.sample(num_of_cards)
			deck.delete(card_one) and location.push(card_one) unless card_one == nil
			deck.delete(card_two) and location.push(card_two) unless card_two == nil
			deck.delete(card_three) and location.push(card_three) unless card_three == nil
		end
			
		location

	end

	def deal_to_players(player_cards)

		players.each do |player|
			player.hand << player_cards.shift(2)
		end

	end

	def display_cards

		player_number = 1
		players.each do |player|
			puts "Player #{player_number}: #{player.hand}"
			player_number += 1
		end
		sleep(2)

	end

	def get_hand(player)

		#puts player.get_hand

	end

	def bet

	end

	def determine_winner

	end
end

game = TexasHoldemDealer.new([], [Player.new, Computer.new, Computer.new, Computer.new])

#while true
	game.play_game
	game.hole_cards
	game.the_flop
	game.the_turn
	game.the_river
	puts "Goodbye!"
	#game.play_again ?  next : break
#end




