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

  def show_new_letters(word_arr)
    puts "Your new letters are: #{word_arr.join(", ")}"
  end

  def show_no_more_shuffles
    puts "Sorry, you have already changed your letters twice!"
  end

  def ask_letters_to_keep(first = true)
    unless first
      puts "Sorry, the letters you selected to keep were not from the list of letters available to you! Try again."
    end
    puts "Please choose, which letters you want to keep!"
    print ">>"
    gets.chomp
  end
end
