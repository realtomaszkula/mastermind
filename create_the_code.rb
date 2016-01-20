class MasterMind
	def initialize(name, code)
		@player = Player.new(name, code)
		@AI = AI.new
		game_play
	end

	Player = Struct.new(:name, :code)

	class AI
		attr_reader :name, :guess
		def initialize
			@name = "NUM_WANG_#{rand(3000)}"
			@guess = [rand(1..6),rand(1..6),rand(1..6),rand(1..6)]
			@memory = []
		end
	end


	def eval (ai_guess, plr_code)
		victory(ai_guess) if ai_guess == plr_code
	end


	def game_play
		puts "#{@player.name} vs #{@AI.name}"
		
		eval(@AI.guess, @player.code)

	end

	def victory(ai_guess)
		puts "\n *** THAAAATS NUMBERWANG!!! ***\n\tWinning number:\n\t#{ai_guess}\n*************************************"
	end







end


puts "Enter name:"
name = gets.chomp

puts "Enter secret code:"
code = gets.chomp.to_i

until code.between?(1111,6666)
	puts "Incorrect input, try again"
	code = gets.chomp.to_i
end

code.to_s.split("").map(&:to_i)

MasterMind.new(name, code)