class Player 
attr_accessor :guess, :guess_array

  def initialize
    @guess = ''
    @guess_array = []
  end

  def get_guess() 
    print "Please make a guess: "
    @guess = gets.downcase.chomp
    validate_guess()
  end

  def validate_guess() 
    if @guess.length == 1 && @guess.match?(/[[:alpha:]]/) && @guess_array.include?(@guess) == false
      used_guess
    else
      invalid_guess
    end
  end

  def used_guess()
    @guess_array.append(@guess)
  end

  def invalid_guess
    puts " invalid guess"
    get_guess
  end

  def show_guess_array()
    print "Used guesses: #{@guess_array}" + "\n" + "\n"
  end

end