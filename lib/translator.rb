# require modules here

require "yaml"

def load_library(file_path)
  # code goes here
  # load file in function scope
  emoticons = YAML.load_file('./lib/emoticons.yml')
  #set up new hash with keys for dealing with data from file
  library_hash = {
    'get_meaning' => {},
    'get_emoticon' => {}
  }
  #iterate through the hash from the file and set up the values of our new hash using the values from the file
  emoticons.each do |key, value|
    library_hash['get_meaning'][value[1]] = key
    library_hash['get_emoticon'][value[0]] = value[1]
  end

  library_hash
end

def get_japanese_emoticon(file_path, emoticon)
  # code goes here
  library = load_library(file_path)['get_emoticon'][emoticon]
  !library ? "Sorry, that emoticon was not found" : library
  # if !library['get_emoticon'][emoticon]
  #   "Sorry, that emoticon was not found"
  # else
  #   library['get_emoticon'][emoticon]
  # end

end

def get_english_meaning(file_path, emoticon)
  # code goes here
  library = load_library(file_path)['get_meaning'][emoticon]
  !library ? "Sorry, that emoticon was not found" : library
  # if !library['get_meaning'][emoticon]
  #   "Sorry, that emoticon was not found"
  # else
  #   library['get_meaning'][emoticon]
  # end
end