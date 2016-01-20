class Mastermind
	def initialize(name, secret_code)
		@code = secret_code
		@player = name
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

MasterMind.new(name, code)