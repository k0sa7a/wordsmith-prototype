class Word
  attr_accessor :valid, :score, :word_try, :possible, :word_arr

  LETTERS_HASH = {"A"=>1,
    "B"=>3,
    "C"=>3,
    "D"=>2,
    "E"=>1,
    "F"=>4,
    "G"=>2,
    "H"=>4,
    "I"=>1,
    "J"=>8,
    "K"=>5,
    "L"=>1,
    "M"=>3,
    "N"=>1,
    "O"=>1,
    "P"=>3,
    "Q"=>10,
    "R"=>1,
    "S"=>1,
    "T"=>1,
    "U"=>1,
    "V"=>4,
    "W"=>4,
    "X"=>8,
    "Y"=>4,
    "Z"=>10}

  def initialize
    @valid = nil
    @possible = nil
    @score = 0
    @word_try = ""
    @word_arr = []
    9.times {@word_arr << ('A'..'Z').to_a.sample}
  end

  def calculate
    @score += add_length_points
    @score += add_letter_points
  end

  def add_length_points
    length = @word_try.length
    case length
      when 3 then return 5
      when 4 then return 7
      when 5 then return 9
      when 6 then return 14
      when 7 then return 17
      when 8 then return 22
      when 9 then return 30
    end
  end

  def add_letter_points
    sum = 0
    @word_try.each_char {|char| sum += LETTERS_HASH[char.upcase]}
    sum
  end
end
