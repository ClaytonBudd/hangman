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
  keyword = keyword.chomp
  keyword.length
end

keyword = pick_keyword(word_doc).chomp
keyword_length = keyword_length(keyword)
keyword_array = keyword.split("")



puts keyword
puts keyword_length
puts "#{keyword_array}"
