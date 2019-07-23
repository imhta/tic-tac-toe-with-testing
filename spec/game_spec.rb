# frozen_string_literal: true

require 'game'
require 'player'
require 'board'

RSpec.describe Game do
  subject(:game) { Game.new }

  describe '#initialize' do
    it 'checking instance object are initialized' do
      expect(game.board).to be_a Board
      expect(game.player1).to be_a Player
      expect(game.player2).to be_a Player
    end
  end
  describe '#ask_player1_side' do
    context 'checking player 1 with valid side' do
      before do
        $stdin = StringIO.new("X\n")
      end
      it 'checking player 1 side is X' do
        game.ask_player1_side
        expect(game.player1.side).to eq 'X'
      end
      after do
        $stdin = STDIN
      end
    end
    context 'checking player 1 without valid side' do
      before do
        allow(Player).to receive(:ask_side).and_return('4', 'bb', 'ee', 'O')
      end
      it 'checking player 1 side with 4' do
        expect(Player).to receive(:ask_side).exactly(4).times
        game.ask_player1_side
      end
    end
  end
  describe '#ask_player_2_side' do
    before do
      $stdin = StringIO.new("X\n")
    end
    it 'checking player 2 side is O' do
      game.ask_player1_side
      game.set_player2_side
      expect(game.player2.side).to eq 'O'
    end
    after do
      $stdin = STDIN
    end
  end
end
