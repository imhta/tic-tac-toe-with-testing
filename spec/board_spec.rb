# frozen_string_literal: true

require_relative './../lib/board'

RSpec.describe Board do
  before { @board = Board.new }
  describe '#intialize' do
    puts 'checking whether new cells are created'
    it 'create new instance variable' do
      expect(@board.cells).to eq([[1, 2, 3],
                                  [4, 5, 6],
                                  [7, 8, 9]]), 'cells are not created'
      expect(@board.moves).to eq(9), 'moves not equal to 9'
      expect(@board.has_no_winner).to be(true), 'board has winner in default'
    end
  end

  describe '#update' do
    puts 'checking whether update method working or not'
    it 'update 1 element  1 array with X' do
      expect(@board.update(1, 'X', 'test user')).to eq([['X', 2, 3],
                                                        [4, 5, 6],
                                                        [7, 8, 9]]), 'updating function not working'
    end
    it 'update pos 5 with O' do
        expect(@board.update(5, 'O', 'test user')).to eq([[1, 2, 3],
                                                          [4, 'O', 6],
                                                          [7, 8, 9]]), 'updating function not working'
    end
    it 'update pos 9 with X' do
        expect(@board.update(9, 'X', 'test user')).to eq([[1, 2, 3],
                                                          [4, 5, 6],
                                                          [7, 8, 'X']]), 'updating function not working'
    end
  end
end
