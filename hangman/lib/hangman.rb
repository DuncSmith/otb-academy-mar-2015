class Game
  attr_reader :lguesses
  attr_accessor :answer, :lives

  def initialize(word)
    @answer = word
    @lives = 15
    @lguesses = []
  end

  def lguess(letter)
    @lguesses << letter
    @lives -= 1 if !@answer.include?(letter)
  end

  def win?
    filter = @lguesses == [] ? " " : @lguesses
    @answer.gsub(/#{filter}/, "").size == 0
  end

end
