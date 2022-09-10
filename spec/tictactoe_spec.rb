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

  describe '#draw_board' do
    # it uses puts, no need to test
  end

  describe '#choose_side' do
    let(:game) { described_class.new }

    context 'when user inputs correct letter' do
      before do
        good_input = 'O'
        allow(game).to receive(:choose_side_msg)
        allow(game).to receive(:gets).and_return(good_input)
        allow(game).to receive(:verify_input).with(good_input).and_return(good_input)
      end

      it 'completes loop without any errors' do
        expect(game).not_to receive(:choose_side_error_msg)
        game.choose_side
      end
    end

    context 'when user inputs an incorrect value once, then a valid input' do
      before do
        allow(game).to receive(:choose_side_msg)
        bad_input = '3'
        good_input = 'X'

        #stub method chain
        game.stub_chain(:gets, :chomp, :upcase).and_return(bad_input, good_input)
      end

      it 'completes loop and displays error message once' do
        expect(game).to receive(:choose_side_error_msg).exactly(1).time
        game.choose_side
      end
    end

    context 'when user inputs incorrect values twice, then a valid input' do
      before do
        allow(game).to receive(:choose_side_msg)
        bad_input = '3'
        good_input = 'X'
        allow(game).to receive(:gets).and_return(bad_input, bad_input, good_input)
      end

      it 'completes loop and displays error message twice' do
        expect(game).to receive(:choose_side_error_msg).exactly(2).times
        game.choose_side
      end
    end
  end

  describe '#verify_input' do
    it 'returns input if input is valid' do

    end

    it 'returns nil if input is invalid' do

    end
  end
end
