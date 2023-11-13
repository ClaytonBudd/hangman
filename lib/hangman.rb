require_relative 'keyword'
require_relative 'player'


class Hangman
  attr_accessor :keyword, :player

  def initialize() 
    @keyword = Keyword.new.keyword
    @keyword_array = @keyword.split("")
    @player = Player.new
    @masked_array = Array.new(@keyword.length, "_")
    @turns = 8
  end
  
  def show_turns_left()
    puts "You have #{@turns} choices remaining" + "\n" + "\n"
  end

  def show_masked_array()
    puts "#{@masked_array}" + "\n" + "\n"
  end

  def check_guess() #change to string logic
    @keyword_array.include?(player.guess)
  end

  def update_masked_array() #change to string logic
    @keyword_array.each_with_index {|letter, index|
      if letter == player.guess 
        @masked_array[index] = letter
    end }
  end

  def win()
    unless @masked_array.include?("_")
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
        show_masked_array
        player.get_guess
        if check_guess == true #
          update_masked_array
          show_masked_array
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


