# frozen_string_literal: true

require_relative './../lib/board'

RSpec.describe Enumerable do
  describe '#check_vertical?' do
    it 'checks if all the  vertically aligned items are the same' do
      expect([['X', 2, 3],
              ['X', 5, 6],
              ['X', 8, 9]].check_vertical?('X', 0)).to be(true), 'vertical items not the same'
    end

    describe '#check_horizontal?' do
      it 'checks if all the  horizontally aligned items are the same' do
        expect([[1, 2, 3],
                %w[O O O],
                [7, 8, 9]][1].check_horizontal?).to be(true), 'horizontal items not the same'
      end
    end

    describe '#check_diagonal?' do
      it 'checks if all the  diagonal aligned items are the same' do
        expect([['X', 2, 'O'],
                [4, 'X', 6],
                [7, 8, 'X']].check_diagonal?('X')).to be(true), 'diagonal items not the same'
      end
    end
  end
end
