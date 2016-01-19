class MasterMind

	def initialize(name)
		@player = Player.new(name)
		@board = Board.new
		@AI = AI.new
		play
	end	

	class Player
		attr_reader :name
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

		def validate_input(guess)
			if guess.class != Fixnum || guess.to_s.size != 4
				puts "Incorrect input, try again"
				return false
			end
			true
		end

	end

	class AI
		attr_reader :numberwang
		def initialize
			@numberwang = [rand(1..6),rand(1..6),rand(1..6),rand(1..6)]
		end

		def view_numberwang
			 p @numberwang
		end
	end

	class Board
		attr_reader :board
		attr_writer :guess

		def initialize
			@guess = draw_guess
			@board = draw_board
		end

		def view_board
			puts @board
		end

		private

		def draw_board
			@board = %{ }
		end

		def draw_guess
			@guess = Array.new(4, " ")
		end
	end

	def play
		puts "Welcome #{@player.name}\!\nComputer generated NUUUUMBERWANG, can you guess what it is?\n ? - ? - ? - ?"
		@player.get_guess
		@board.view_board
		@AI.view_numberwang
	end

	def game_over?
	  return true if @AI.numberwang = @player.guess
	  false
	end

end


puts %{*** Hello, welcome to NUMBERWANG ***
ENTER PLAYER NAME:}

plr = gets.chomp
MasterMind.new(plr)
