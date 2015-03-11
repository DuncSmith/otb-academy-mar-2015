class Game
  attr_reader :lguesses, :wguesses
  attr_accessor :answer, :lives

  def initialize(answer)
    @answer = answer
    @lives = 15
    @lguesses = []
    @wguesses = []
  end

  def lguess(letter)
    @lguesses << letter
    adjust_life(letter)
  end

  def wguess(word)
    @wguesses << word
    @lives -= 1 if word != @answer
  end

  def progress
    @answer.gsub(/[^#{@lguesses.uniq.join}]/, "_")
  end

  def win?
    letter_win? || word_win?
  end

  def game_over?
    @lives == 0
  end

  private

  def letter_win?
    filter = @lguesses == [] ? " " : @lguesses
    @answer.gsub(/#{filter}/, "").size == 0
  end

  def word_win?
    @wguesses.select { |w| w == @answer }.any?
  end

  def adjust_life(letter)
    @lives -= 1 if !@answer.include?(letter)
  end

end
