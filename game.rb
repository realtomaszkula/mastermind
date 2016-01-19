class MasterMind
	@@turn = 1
	def initialize(name)
		@player = Player.new(name)
		@board = Board.new
		@AI = AI.new
		
		play
	end	

	class Player
		attr_reader :name, :guess
		def initialize(name)
			@name = name
		end

		def get_guess
			puts "#{@name}, enter your guess: "
			guess = gets.chomp.to_i

			until validate_input(guess)
				guess = gets.chomp.to_i
			end

			@guess = guess.to_s.split("").map(&:to_i)
		end

		private
		def validate_input(guess)
			if guess.class != Fixnum || guess.to_s.size != 4
				puts "Incorrect input, try again"
				return false
			end
			true
		end

	end

	class AI
		attr_reader :numberwang, :clues
		def initialize
			@numberwang = [rand(1..6),rand(1..6),rand(1..6),rand(1..6)]

		end

		def eval(plr_guess)
			@clues = {
				blacks: 0,
				whites: 0
			}
			
			indx = []
			temp_wang = numberwang.dup
			temp_plr = plr_guess.dup

			for i in 0..3
				indx << i if temp_wang[i] == plr_guess[i]
			end
			indx.each_with_index {|x, i| temp_wang.delete_at(x-i)}
			indx.each_with_index {|x, i| temp_plr.delete_at(x-i)}
			@clues[:blacks] = 4 - temp_wang.size

			p temp_wang
			p temp_plr

			# for i in 0..tempsize
			# 	if temp[i]

			# end

			# indx = []

			# plr_guess.each {|x| }


			# [2,2,3]
			# [4,2,3,1]	


		end
		
	end

	class Board
		attr_reader :board
		attr_writer :guess

		def initialize
			@board = ""
		end

		def draw_board(plr_guess, ai_clues)
			@board << "#{plr_guess[0]}  - #{plr_guess[1]} - #{plr_guess[2]} - #{plr_guess[3]} -- BLACKS: #{ai_clues[:blacks]} -- WHITES: #{ai_clues[:whites]} \n"
			puts @board
		end
	end

	def play
		puts "Welcome #{@player.name}\!\nComputer generated NUUUUMBERWANG, can you guess what it is?\n ? - ? - ? - ?"
		loop do
			puts "Turn: #{@@turn} --- Numberwang: #{@AI.numberwang}"
		  	@player.get_guess
		  	@AI.eval(@player.guess)
		  	@board.draw_board(@player.guess, @AI.clues)
			break if numberwang? || game_over?
		end
	end

	def game_over?		
		if @@turn == 10
			puts " *** Times Up, see you next week on NUMBERWANG! ***"
			return true
		end
		@@turn += 1
		false
	end

	def numberwang?
	  if @AI.numberwang.sort == @player.guess.sort 
	  	puts "\n *** THAAAATS NUMBERWANG!!! ***\n\tWinning number:\n\t#{@player.guess}\n*************************************"
	  	return true
	  end
	  false
	end
end


puts %{*** Hello, welcome to NUMBERWANG ***
ENTER PLAYER NAME:}

plr = gets.chomp
MasterMind.new(plr)
