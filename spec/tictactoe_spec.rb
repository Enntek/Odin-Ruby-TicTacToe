 #spec/main_spec.rb
require './lib/tictactoe'

# This is to practice stubbing, mocking, etc. in RSpec
# For practice I am writing excessive tests that are coupled to the implementation

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

        # stub method chain
        allow(game).to receive_message_chain(:gets, :chomp, :upcase).and_return(bad_input, good_input)
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
      valid_letter = 'X'
      verify_input = game.verify_input(valid_letter)
      expect(verify_input).to eq(valid_letter)
    end

    it 'returns nil if input is invalid' do
      incorrect_input = '3'
      verify_input = game.verify_input(incorrect_input)
      expect(verify_input).to be_nil
    end
  end

  describe 'described_class instantiation' do
    it 'calls new twice on Player class' do
      expect(Player).to receive(:new).exactly(2).times
      described_class.new
    end
  end

  # You must connect :game to the two instances created in the init.
  # These two instances will receive :establish_side

  describe '#establish_sides' do
    # let(:p1) { instance_double(Player) }
    let(:game) { described_class.new }

    before do
      allow(game).to receive(:choose_side)
    end

    it 'sends #establish_side to player1' do
      expect(game.player1).to receive(:establish_side)
      game.establish_sides
    end

    it 'sends #establish_side to player2' do
      expect(game.player2).to receive(:establish_side)
      game.establish_sides
    end
  end

  describe '#take_turns' do
    # This is a public script method, it does not need to be tested,
    # however, the method it calls may need testing
  end

  describe '#take_available_cell' do
    before do
      allow(game.current_turn).to receive(:side)
    end

    it 'sets specific gameboard cell to X or O' do
      valid_number = 3
      expect(game.game_board).to receive(:change_cell_state)
      game.take_available_cell(valid_number)
    end
  end

  describe '#pick_valid_cell' do

    context 'when user gives 1 invalid input, then a valid input' do
      it 'completes loop and receives 1 error' do
  
        game.pick_valid_cell
      end
    end

    context 'when user gives 2 invalid inputs, then a valid input' do
      it 'completes loop and receives 2 errors' do
  
      end
    end

    context 'when user gives a valid input' do
      it 'returns valid_number' do
  
      end
    end
  end
end
