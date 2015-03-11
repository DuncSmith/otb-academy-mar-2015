require_relative 'lib/hangman.rb'

RSpec.describe "A game of hangman" do

    it "creates a new game object" do
      game = Game.new("ruby")
      expect( game.class ).to eq(Game)
    end

    describe "A new game" do
      let(:game) { Game.new("ruby") }

      it "should tell us the answer" do
        expect( game.answer ).to eq("ruby")
      end

      it "tell us the number of lives remaining" do
        expect( game.lives ).to eq(15)
      end

      it "should decrement the number of lives after a incorrect guess" do
        game.lguess("a")
        expect( game.lives ).to eq(14)
      end

      it "can should tell us we have not won " do
        expect( game.win? ).to eq(false)
      end

      it "can should tell us we have won after providing correct guesses" do
        game.lguess("r")
        game.lguess("u")
        game.lguess("b")
        game.lguess("y")
        expect( game.win? ).to eq(true)
      end
      it "can tell us the guesses so far" do
        game.lguess("r")
        expect( game.lguesses ).to eq(["r"])
      end

      it "can show us the game progress" do
        game.lguess("y")
        game.lguess("u")
        expect( game.progress ).to eq("_u_y")
      end

      it "incorrect word guesses decrement a life" do
        game.wguess("java")
        expect( game.lives ).to eq(14)
      end

      it "can show us words guessed already" do
        game.wguess("java")
        expect( game.wguesses ).to eq(["java"])
      end

      it "an correct word guess will win the game" do
        game.wguess("ruby")
        expect( game.win? ).to eq(true)
      end
    end
end
