require_relative 'keyword'
require_relative 'player'


class Hangman
  attr_accessor :keyword, :player

  def initialize() 
    @keyword = Keyword.new.keyword
    @player = Player.new
    @puzzle = "_" * @keyword.length 
    @turns = 8
  end
  
  def show_turns_left()
    puts "You have #{@turns} choices remaining" + "\n" + "\n"
  end

  def show_puzzle()
    puts "#{@puzzle}" + "\n" + "\n"
  end

  def check_guess() 
    @keyword.include?(player.guess)
  end

  def update_puzzle() 
    @keyword.each_char.with_index {|char, index|
      if char == player.guess 
        @puzzle[index] = player.guess
    end }
  end

  def win()
    unless @puzzle.include?("_")
      true
    else
      false
    end
  end

  def play()
    while win == false
      if @turns == 0 
        abort "you lose the word was: #{@keyword}"
      else 
        show_turns_left
        show_puzzle
        player.get_guess
        if check_guess == true #
          update_puzzle
          show_puzzle
          player.show_guess_array
          puts "Excellent choice"
        else
          puts "incorrect" + "\n" 
          player.show_guess_array
          @turns -= 1
        end
      end
    end
    puts "You win!"
  end
    
end

game = Hangman.new()
game.play()


