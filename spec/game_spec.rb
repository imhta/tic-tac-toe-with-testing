# frozen_string_literal: true

require_relative './../lib/game'

RSpec.describe Game do

  describe '#ask_player1_side' do
 
    before do
      @game = Game.new
       end
    it 'breaks the loop' do

      end

           
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
