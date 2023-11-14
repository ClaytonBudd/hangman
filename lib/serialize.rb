module Serialize
  def to_yaml 
    YAML.dump ({
      :keyword => @keyword,
      :puzzle => @puzzle,
      :turns => @turns,
      :guess => player.guess,
      :guess_array => player.guess_array
    })
  end



  def self_from_yaml(yaml)
    data = YAML.load yaml
    puts "\n" + "Game loaded: " + "\n"
    @keyword = data[:keyword]
    @puzzle =  data[:puzzle] 
    @turns =   data[:turns]
    @guess_array = data[:guess_array]
  end


end