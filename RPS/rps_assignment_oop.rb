####################
#Rock Paper Scissors OOP
#Tim Williams 1/26/2015
#####################

#Nouns: player_1, computer, rock_array, paper_array, scissors_array

#I watched the solution, so I know that I didn't do a great job converting 
#this assignment to OOP. It difficult for me to differentiate between a class
#and an instance variable.
class RPS 
  attr_accessor :user_input, :computer_input_string, :user_input_array


  def who_won?
    op_hash = {"1" => "+" , "2" => "-", "3" => "*", "4" => "/"}
    puts "#{first_number} #{op_hash[operator]} #{second_number} = #{result}"
  end 

  def get_user_input
    #                  W          L       T
    rock_array     = ["scissors","paper","rock"]
    paper_array    = ["rock","scissors","paper"] 
    scissors_array = ["paper","rock","scissors"] 
  
    #Get and validate user input
    loop do 
      puts "Choose one: (R/P/S)"
      user_input = gets.chomp

      #Make sure the user enters a valid number
      if  user_input.upcase == "R" 
        self.user_input_array = rock_array
        break
      elsif user_input.upcase == "P"
        self.user_input_array = paper_array
        break
      elsif user_input.upcase == "S"
        self.user_input_array = scissors_array
        break  
      else 
        puts "You did not enter a vaid character. Try again"
      end
    end 
  end 

  def get_computer_input

    self.computer_input_string = ["rock","scissors","paper"].sample 

  end 

  def display_winner
    #Who won?
    if computer_input_string == user_input_array[0]
      puts "You picked #{user_input_array[2]}. The computer picked #{computer_input_string}. You won!"
    elsif computer_input_string == user_input_array[1]
      puts "You picked #{user_input_array[2]}. The computer picked #{computer_input_string}. You lose!"
    elsif computer_input_string == user_input_array[2]
      puts "You picked #{user_input_array[2]}. The computer picked #{computer_input_string}. You tied"
    end 

  end 

  def run
    begin
      puts "Play Rock Paper Scissors!"
      #Get user input
      get_user_input
      #Get computer input
      get_computer_input
      #display winner
      display_winner
      #Play again?
      puts "If you want to try again type 'Y'" 
      response = gets.chomp 
    end while response.upcase == 'Y'
  end 

end 

new_game = RPS.new
new_game.run
