# frozen_string_literal: true

require_relative './../lib/game'

RSpec.describe Game do
  game = Game.new

  describe '#ask_player_name' do
    before do
      $stdin = StringIO.new("Mouha\n")
    end

    it 'name should be Mouha' do
      expect(game.ask_players_name).to eq 'Mouha'
    end
    after do
      $stdin = STDIN
    end
  end

  # describe '#start' do
  #   it 'initializes the values of turn and valid move' do

  #     expect(game.turn).to eq(1), 'game turn not equal to 1'
  #     expect(game.valid_move).to be(false), 'valid move not false'
  #     puts game.turn
  #   end
  # end
end
