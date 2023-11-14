require_relative 'keyword'
require_relative 'player'
require_relative 'serialize'
require          'yaml'


class Hangman 
  attr_accessor :keyword, :player, :turns, :puzzle
  include Serialize

  def initialize() 
    @keyword = Keyword.new.keyword
    @player = Player.new
    @puzzle = "_" * keyword.length 
    @turns = 8
    start_menu
  end
  
  def show_turns_left()
    puts "You have #{@turns} choices remaining" + "\n" + "\n"
  end

  def show_puzzle()
    puts "#{@puzzle}" + "\n" + "\n"
  end

  def check_guess() 
    keyword.include?(player.guess)
  end

  def update_puzzle() 
     keyword.each_char.with_index {|char, index|
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
        guess = player.get_guess
        if guess == 'save'
          save_game
        else
          if check_guess == true
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
    end
    puts "You win!"
  end

  def save_directory
    if Dir.exist?('save') == false
      Dir.mkdir("save")
    end
  end

  def save_game
    print "Please enter a save name no spaces: "
    save_name = gets.chomp
    serialized_data = to_yaml
    save_directory
    if !File.exist?("save/save_name")
      File.write("save/#{save_name}", serialized_data)
      puts "Game saved."
    end
  end

  def load_game
    puts Dir.entries("save")
    print "Please enter game you would like to load: "
    load_name = gets.chomp
    game_file = File.read("save/#{load_name}")
    game = self_from_yaml(game_file)
    play
  end

  def start_menu
      print "Please enter 1 for new game or 2 to load saved game: "
      selection = gets.chomp 
      while selection != "1" && selection != "2"
        "invalid selection"
        start_menu
      end
      if selection == "1"
        play
      elsif selection == "2"
        load_game 
      end
  end
end

game = Hangman.new
game.start_menu



