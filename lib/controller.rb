require 'open-uri'
require 'json'
require_relative 'view'

class Controller
  attr_reader :word, :shuffles

  def initialize(word)
    @word = word
    @shuffles = 0
    @view = View.new
  end

  def submit
    @word.word_try = @view.ask_for_word
    check_possible_word(@word.word_try)
    if @word.possible
      check_english_word(@word.word_try)
      if @word.valid
        @word.calculate
        @view.reply_valid(@word.word_try, @word.score)
      else
        @view.reply_invalid(@word.word_try)
      end
    else
      @view.reply_impossible(@word.word_try, @word.word_arr)
    end
  end

  private

  def check_english_word(word)
    url = "https://www.dictionaryapi.com/api/v3/references/collegiate/json/#{word}?key=57f6b9af-9756-4b74-b134-ee1cc8513b5f"
    ser_result = URI.open(url).read
    result = JSON.parse(ser_result)
    @word.valid = result[0].class == Hash
  end

  def check_possible_word(word)
    try_arr = word.upcase.chars
    @word.possible = try_arr.all? { |letter| try_arr.count(letter) <= @word.word_arr.count(letter) }
  end

end
