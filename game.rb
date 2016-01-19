class MasterMind

	def initialize(name)
		@player = Player.new(name)
		@board = Board.new
		@AI = AI.new
		play
	end	

	Player = Struct.new(:name)	

	class AI
		attr_reader :numberwang
		def initialize
			@numberwang = [rand(1..6),rand(1..6),rand(1..6),rand(1..6)]
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
			@board = %{\n            c   o\nx|#{@guess[0]}|#{@guess[1]}|#{@guess[2]}|#{@guess[3]}|-| |-| |}
		end

		def draw_guess
			@guess = [" "," "," "," "]
		end
	end

	def play
		@board.view_board
		@AI.numberwang
	end

end


puts %{*** Hello, welcome to NUMBERWANG ***
ENTER PLAYER NAME:}

plr = gets.chomp
MasterMind.new(plr)
