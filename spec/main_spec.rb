#spec/main_spec.rb
require './lib/tictactoe'

# Let's just test a few select methods and move onto Connect 4

describe TicTacToe do
  let(:game) { described_class.new }
  # let(:player) { class_double(Player) }

  describe '#initialize' do
    # No test necessary when only creating instance variables
  end

  describe '#play_game' do
    # Public Script Method -> No test necessary, but all methods inside 
    # should be tested.
  end

  describe '#create_board' do
     it 'sets a variable to a new array' do
      expect(Array).to receive(:new).at_least(1).time
      game.create_board
    end
  end

  before do
    allow(game).to receive(:puts)
    allow(game).to receive(:greeting)

    allow(game).to receive(:draw_board)
    allow(game).to receive(:game_loop)
    # allow(player).to receive(:new)
    # allow(player).to receive(:choose_side)
  end

  # Odin said testing not needed for these type of methods but
  # it may be good stub and mock practice
  describe '#play_game' do
    xit 'instantiates Player twice' do

      # player = class_double(Player)

      # expect(player).to receive(:new)
      game.play_game
    end
  end
  context 'when it asks to play again' do
    before do
      allow(game).to receive(:gets).and_return('y') # stub

    end

    describe '#play_again' do
      it 'creates a new Array' do
        expect(Array).to receive(:new)
        game.play_again
      end

      it 'calls #draw_board' do
        expect(game).to receive(:draw_board)
        game.play_again
      end

      it 'calls #game_loop' do
        expect(game).to receive(:game_loop)
        game.play_again
      end
    end
  end
end
