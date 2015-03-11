class Game
  attr_accessor :answer, :lives

  def initialize(word)
    @answer = word
    @lives = 15
    @lguesses = [" "]
  end

  def lguess(letter)
    @lguesses << letter
    @lives -= 1 if !@answer.include?(letter)
  end

  def win?
    @answer.gsub(/#{@lguesses}/, "").size == 0
  end

end
