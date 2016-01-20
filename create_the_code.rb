class MasterMind
	def initialize(name, code)
		@player = Player.new(name, code)
		@computer = AI.new
		@turn = 1
		game_play
	end

	Player = Struct.new(:name, :code)

	class AI
		attr_reader :name, :guess, :guess_again
		def initialize
			@name = "NUM_WANG_#{rand(3000)}"
			@guess = [rand(1..6),rand(1..6),rand(1..6),rand(1..6)]
			@memory = []
		end

		def guess_again
			@guess = [rand(1..6),rand(1..6),rand(1..6),rand(1..6)]
		end
	end

	def eval_blacks(temp_plr_code, temp_ai_guess)
			indx = []
			for i in 0..3
				indx << i if temp_plr_code[i] == temp_ai_guess[i]
			end
			indx.each_with_index {|x, i| temp_plr_code.delete_at(x-i)}
			indx.each_with_index {|x, i| temp_ai_guess.delete_at(x-i)}
			return results = [temp_plr_code, temp_ai_guess]
	end

	def eval_whites(temp_plr_code, temp_ai_guess)
			counter = 0
			alr_chkd = []
			for i in 0..temp_plr_code.size-1
				for k in 0..temp_plr_code.size-1
					if temp_ai_guess[i] == temp_plr_code[k] && !alr_chkd.include?(k)
							counter += 1
							alr_chkd << k
							next
					end	
				end
			end
			counter
	end

	def eval (ai_guess, plr_code)
			victory(ai_guess) if ai_guess == plr_code

			@clues = {
				blacks: 0,
				whites: 0
			}

			temp_plr_code = plr_code.dup
			temp_ai_guess = ai_guess.dup
			
			temp_plr_code, temp_ai_guess = eval_blacks(temp_plr_code, temp_ai_guess)

			@clues[:blacks] = 4 - temp_plr_code.size
			@clues[:whites] = eval_whites(temp_plr_code, temp_ai_guess)
	end

	def victory(ai_guess)
		puts "\n *** THAAAATS NUMBERWANG!!! ***\n\tWinning number:\n\t#{ai_guess}\n*************************************"
	end

	def change_turn
		@turn += 1
	end


	def game_play
		puts "#{@player.name} vs #{@computer.name}"
		
		while @turn < 11
		  p @computer.guess
		  eval(@computer.guess, @player.code)
		  change_turn
		  @computer.guess_again
		end
	end

end


# puts "Enter name:"
# name = gets.chomp

name = "Tom"

puts "Enter secret code:"
code = gets.chomp.to_i

until code.between?(1111,6666)
	puts "Incorrect input, try again"
	code = gets.chomp.to_i
end

code = code.to_s.split("").map(&:to_i)

MasterMind.new(name, code)