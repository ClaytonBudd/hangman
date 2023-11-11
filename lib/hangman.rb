word_doc = "google-10000-english-no-swears.txt"


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

keyword = pick_keyword(word_doc).chomp
keyword_length = keyword_length(keyword)
keyword_array = keyword.split("")
guess_array = []

def get_guess 
  puts "Please make a guess: "
  guess = gets.downcase.chomp
  validate_guess(guess)
end

def used_guess(guess, guess_array)
  guess_array.append(guess)
end

def validate_guess(guess)
  if guess.length == 1 && guess.match?(/[[:alpha:]]/)
    return guess
  else
    puts "invalid guess"
    get_guess
  end
end

def check_guess(guess, keyword_array)
  keyword_array.include?(guess)
end
    

def mask_keyword(keyword_length)
  Array.new(keyword_length, "_")
end



guess = get_guess
foo = used_guess(guess, guess_array)
check_guess(guess, keyword_array)
puts "#{foo}"
puts keyword
puts keyword_length
puts "#{keyword_array}"
puts "#{mask_keyword(keyword_length)}"