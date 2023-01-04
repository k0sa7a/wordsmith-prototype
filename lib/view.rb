class View
  def reply_invalid(word)
    puts "Sorry! The word '#{word.upcase}' is not a valid english word."
    puts "YOUR SCORE IS: 0"
  end

  def reply_valid(word, score)
    puts "Congratulations! The word '#{word.upcase}' is a valid english word."
    puts "YOUR SCORE IS: #{score}"
  end

  def ask_for_word
    puts "What is the WORD you want to play?"
    print ">>"
    gets.chomp
  end

  def reply_impossible(word, letters_arr)
    puts "Sorry! The word '#{word.upcase}' cannot be written with the letters: #{letters_arr}."
    puts "YOUR SCORE IS: 0"
  end
end
