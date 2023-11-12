word_doc = "google-10000-english-no-swears.txt"

class Hangman
  def initialize() 
  word_doc = "google-10000-english-no-swears.txt"  
  @keyword = pick_keyword(word_doc).chomp
  @keyword_length = @keyword.length()
  @keyword_array = @keyword.split("")
  @guess_array = []
  @masked_array = Array.new(@keyword_length, "_")
  @guess = nil
  @turns = 8
  end
  
  def show_turns_left()
    puts "You have #{@turns} choices remaining" + "\n" + "\n"
  end

  def show_masked_array()
    puts "#{@masked_array}" + "\n" + "\n"
  end

  def show_guess_array()
    puts " Used guesses:" + "\n"
    puts "#{@guess_array}"
  end

  def pick_keyword(file)
    while true 
      keyword = File.readlines(file).sample
      keyword_length = keyword_length(keyword)
      if keyword_length > 4 && keyword_length < 13
        return keyword
      else
        next
      end
    end
  end

  def keyword_length(keyword)
    keyword.chomp.length
  end

  def invalid_guess
    puts " invalid guess"
    get_guess
  end

  def get_guess() 
    puts "Please make a guess: "
    @guess = gets.downcase.chomp
    puts "\n"
    validate_guess()
  end

  def used_guess()
    @guess_array.append(@guess)
  end

  def validate_guess() #add validate for guess array??
    if @guess.length == 1 && @guess.match?(/[[:alpha:]]/) && @guess_array.include?(@guess) == false
      used_guess
    else
      invalid_guess
    end
  end

  def check_guess() #double duty for keyword_array and guess_array
    @keyword_array.include?(@guess)
  end

  def update_masked_array()
    @keyword_array.each_with_index {|letter, index|
      if letter == @guess 
        @masked_array[index] = @guess 
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
        get_guess
        if check_guess == true
          update_masked_array
          show_masked_array
          show_guess_array
          puts "Excellent choice"
        else
          puts "incorrect" + "\n" + "\n"
          show_guess_array
          @turns -= 1
        end
      end
    end
    puts "You win!"
  end
    
end

game = Hangman.new()
game.play()


#masked_array = mask_keyword(keyword_length)
#guess = get_guess
#foo = used_guess(guess, guess_array)
#check_guess(guess, keyword_array)
#puts keyword
#puts "keyword array" + "#{keyword_array}"
#puts "#{mask_keyword(keyword_length)}"
#puts "masked array" + "#{update_masked_array(keyword_array, guess, masked_array)}"







#get keyword > keyword_length > keyword_array (keyword class?????)

#if win condition not met ( keyword_array == [] ) || max turns reached ()

#display masked keyword

#get player guess > validate guess > add to guess array > check guess 

#if check_guess true > 
  #keyword_array each with index 
  #for every match remove value from kwdarry and overwrite in masked array at correct index
  #advance turn counter
#false 
  #advance turn counter
  #show guess array
  