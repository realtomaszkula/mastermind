class MasterMind

	def initialize(name)
		@player = Player.new(name)
		@board = Board.new
		play
	end	

	Player = Struct.new(:name)	

	class Board
		attr_accessor :guess
		attr_reader :board

		def initialize
			@board = draw_board
			@guess = draw_guess
		end


		def draw_board	
			@board = %{\n              c   o\nx|#{g[0]}|#{g[1]}|#{g[2]}|#{g[3]}|-| |-| |}
		end

		def draw_guess
			@guess = [" "," "," "," "]
		end
	end
end




puts %{*** Hello, welcome to NUMBERWANG ***
ENTER PLAYER NAME:}

plr = gets.chomp
MasterMind.new(plr)
