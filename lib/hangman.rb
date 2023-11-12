word_doc = "google-10000-english-no-swears.txt"

class Hangman
  def initialize() 
  @keyword = "tittiesoboy" # temp for testing #keyword = pick_keyword(word_doc).chomp
  @keyword_length = keyword_length(@keyword)
  @keyword_array = @keyword.split("")
  @guess_array = []
  @guess = nil
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

  def get_guess() 
    puts "Please make a guess: "
    @guess = gets.downcase.chomp
    validate_guess()
  end

  def used_guess()
    @guess_array.append(@guess)
    puts "#{@guess_array}"
  end

  def validate_guess() #add validate for guess array??
    if @guess.length == 1 && @guess.match?(/[[:alpha:]]/)
      used_guess()
    else
      puts "invalid guess"
      get_guess()
    end
  end

  def check_guess(guess, array) #double duty for keyword_array and guess_array
    array.include?(guess)
  end
    

  def mask_keyword(keyword_length)
    Array.new(keyword_length, "_")
  end


  def update_masked_array(keyword_array, guess, masked_array)
    keyword_array.each_with_index {|letter, index|
      if letter == guess 
        keyword_array - [index]
        masked_array[index] = guess
    end }
    return masked_array
  end
end

game = Hangman.new()
game.get_guess()


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
  