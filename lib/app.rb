word_arr = []

# Start of game: 9 random letters
require_relative 'router'
require_relative 'word'
require_relative 'controller'

word = Word.new
controller = Controller.new(word)
router = Router.new(controller)

# Start the app
router.run
