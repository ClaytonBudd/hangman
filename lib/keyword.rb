class Keyword 
  attr_accessor :keyword
  
  
  def initialize
    word_doc = "google-10000-english-no-swears.txt"
    @keyword = pick_keyword(word_doc)
  end 
  
  def pick_keyword(file)
    while true 
      @keyword = File.readlines(file).sample.chomp
      if keyword.length > 4 && keyword.length < 13
        return keyword
      else
        next
      end
    end
  end


end
