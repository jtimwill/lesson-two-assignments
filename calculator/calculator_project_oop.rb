#OOP Calculator Assignment
#Tim Williams 1/26/2015

# 1. Nouns: Calculator, first_number, second_number, operator, result
# 2. Verbs: multiply, divide, add, subtract, get_first_number, 
#           get_second_number, get_operand, validate_number, validate_operand

class Calculator
  attr_accessor :first_number, :second_number, :operator, :result

  # def initialize(first, second, op)

  #   @first_number = first
  #   @second_number = second
  #   @operator = op

  # end

  # def to_s
  #    op_hash = {"1" => "+" , "2" => "-", "3" => "*", "4" => "/"}
  #   "#{first_number} #{op_hash[operator]} #{second_number} = #{result}"
  # end 

  def display_result
    op_hash = {"1" => "+" , "2" => "-", "3" => "*", "4" => "/"}
    puts "#{first_number} #{op_hash[operator]} #{second_number} = #{result}"
  end 

  def calculate_answer

    self.result = case operator #Perform selected operation

    when "1"
      result = first_number.to_f + second_number.to_f
    when "2"
      result = first_number.to_f - second_number.to_f
    when "3"
      result = first_number.to_f * second_number.to_f
    when "4"
      result = first_number.to_f / second_number.to_f
    end 

  end 


  def get_user_input

    #Get the numbers
    loop do 
      puts "What is your first number?"

      self.first_number = gets.chomp
      #Make sure the user enters a valid number
      if  first_number != "0" && first_number.to_i == 0
          puts "You did not enter a number. Try again"
      else 
        break
      end
    end 
 

    loop do 
      puts "What is your second number"

      self.second_number = gets.chomp
      #Make sure the user enters a valid number
      if  second_number != "0" && second_number.to_i == 0
          puts "You did not enter a number. Try again"
      else 
        break
      end
    end 


   loop do  

      puts "Select an operation:"
      puts "1: addition"
      puts "2: subtraction"
      puts "3: multiplication"
      puts "4: division"

      self.operator = gets.chomp
      #Make sure that the user selects a valid operation
      if operator == "1" || operator == "2" || operator == "3" || operator == "4"
        break
      else 
      puts "You selected an invalid operation. Try again"
      end
    end

  end 


  def run
    begin
      #Get user input
      get_user_input
      #Calculate result
      calculate_answer
      #Output results 
      display_result
      #Play again?
      puts "If you want to try again type 'Y'" 
      response = gets.chomp 
    end while response.upcase == 'Y'
  end 

end 

new_calculator = Calculator.new
new_calculator.run










