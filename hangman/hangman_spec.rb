require_relative 'lib/hangman.rb'

RSpec.describe "A game of hangman" do

    it "creates a new game object" do
      game = Game.new
      expect( game.class ).to eq(Game)
    end

    describe "A new game" do
      let(:game) { Game.new }

      it "should accept a answer" do
        game.answer = "ruby"
        expect( game.answer ).to eq("ruby")
      end

      it "tell us the number of lives remaining" do
        expect( game.lives ).to eq(15)
      end

      it "will not let us guess if an answer has not yet been given" do
        skip
      end

      it "should decrement the number of lives after a incorrect guess" do
        skip
      end

      it "can tell us the answer if requested" do
        skip
      end

      it "can tell us if we have won" do
        skip
      end

      it "can tell us the guesses so far" do
        skip
      end

      it "can show us the game progress" do
        skip
      end

      it "will accept word guesses" do
        skip
      end

      it "can show us words guessed already" do
        skip
      end

    end


end
