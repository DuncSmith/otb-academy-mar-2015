class Game
  attr_accessor :answer, :lives

  def initialize(word)
    @answer = word
    @lives = 15
  end
end
