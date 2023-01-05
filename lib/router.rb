class Router
  def initialize(controller)
    @controller = controller
    @running = true
  end

  def run
    display_rules
    puts "Your letters are: #{@controller.word.word_arr.join(", ")}"

    while @controller.shuffles < 3 && @running
      display_options
      action = gets.chomp.to_i
      route_actions(action)
    end
  end

  def display_options
    puts "Please choose one of the following:"
    puts "1: Submit your WORD try"
    if @controller.shuffles < 2
      puts "2: Give all LETTERS you want to keep and replace remaining ones"
      puts "3: Replace all LETTERS"
    end
    print ">>"
  end

  def display_rules
    puts "Welcome to the WordSmith game!"
    puts "The rules are very simple:"
    puts "You will be given 9 random letters"
    puts "Your objective is to create the longest possible (valid English) word using the letters provided"
    puts "You will be given 2 chances to change all or some of your letters (if you want to). Each re-drawing is -5 points from your total score\n\n"
    puts "Once you choose to play with your word your score will be calculated based on: length of the word and the letters used"
    puts "3 letter words: 5 points"
    puts "4 letter words: 7 points"
    puts "5 letter words: 9 points"
    puts "6 letter words: 14 points"
    puts "7 letter words: 17 points"
    puts "8 letter word: 22 points"
    puts "9 letter word: 30 points"
    puts "\n"
    puts "Each 'A, E, I, O, U, L, N, S, T, R' letter is worth 1 point"
    puts "Each 'D, G' letter is worth 2 points"
    puts "Each 'B, C, M, P' letter is worth 3 points"
    puts "Each 'F, H, V, W, Y' letter is worth 4 points"
    puts "Each 'K' letter is worth 5 points"
    puts "Each 'J, X' letter is worth 8 points"
    puts "Each 'Q, Z' letter is worth 10 points"
    puts "\n"
  end

  def route_actions(action)
    case action
    when 1
      @controller.submit
      @running = false
    when 2 then @controller.change
    when 3 then @controller.replace_all
    end
  end
end
