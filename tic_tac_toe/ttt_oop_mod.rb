
####################
#Tic Tac Toe OOP Attempt
#Tim Williams 1/28/2015
#Note: this program was apdapted from the precdural tic-tac-toe solution 
#created by the instructors at Tealeaf Academy. 
#####################

#Nouns: Player, Human, Computer, GameBoard, Game


class Player #All players can scan the board for open positions
  attr_reader :name
  def initialize(n)
    @name = n
  end 

  def empty_positions(board)
    board.keys.select {|position| board[position] == ' ' }
  end
end 

class Human <Player #Humans require user input to place pieces
  def places_piece(board)
    begin
      puts "Choose a position (from 1 to 9) to place a piece:"
      position = gets.chomp.to_i
    end until empty_positions(board).include?(position)
    board[position] = 'X'
  end
end 

class Computer <Player #Computers automatically place pieces
  def places_piece(board)
    position = empty_positions(board).sample
    board[position] = 'O'
  end
end 

class GameBoard #This class initiaizes and dispays the board
  attr_accessor :board

  def initialize
    @board = {}
    (1..9).each {|position| board[position] = ' ' }
  end

  def new_board
    (1..9).each {|position| self.board[position] = ' ' }
  end

  def draw_board
    system 'clear'
    puts
    puts "     |     |"
    puts "  #{board[1]}  |  #{board[2]}  |  #{board[3]}"
    puts "     |     |"
    puts "-----+-----+-----"
    puts "     |     |"
    puts "  #{board[4]}  |  #{board[5]}  |  #{board[6]}"
    puts "     |     |"
    puts "-----+-----+-----"
    puts "     |     |"
    puts "  #{board[7]}  |  #{board[8]}  |  #{board[9]}"
    puts "     |     |"
    puts
  end
end 

class Game #This class compares 
  attr_reader :player, :computer
  attr_accessor :tic_tac_toe

  def initialize
    @player = Human.new("Bill")
    @computer = Computer.new("Chip")
    @tic_tac_toe = GameBoard.new
  end

  def check_winner(board)
    winning_lines = [[1,2,3], [4,5,6], [7,8,9], [1,4,7], [2,5,8], [3,6,9], [1,5,9], [3,5,7]]
    winning_lines.each do |line|
      return "Player" if board.values_at(*line).count('X') == 3
      return "Computer" if board.values_at(*line).count('O') == 3
    end
    nil
  end

  def announce_winner(winner)
    puts "#{winner} won!"
  end

  def play
    begin
      tic_tac_toe.new_board
      tic_tac_toe.draw_board
      begin
        player.places_piece(tic_tac_toe.board)
        tic_tac_toe.draw_board
        computer.places_piece(tic_tac_toe.board)
        tic_tac_toe.draw_board
        winner = check_winner(tic_tac_toe.board)
      end until winner || player.empty_positions(tic_tac_toe.board) == []
      if winner
        announce_winner(winner)
      else
        puts "It's a tie."
      end
      #Play again?
      puts "If you want to try again type 'Y'" 
      response = gets.chomp 
    end while response.upcase == 'Y' 
  end 
end 

new_game = Game.new
new_game.play
