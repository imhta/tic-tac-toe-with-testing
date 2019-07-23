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
  describe '#game_over?' do
    it 'checks if game is over with horizontal alignement' do
      @board.update(1, 'X', 'test user')
      @board.update(2, 'X', 'test user')
      @board.update(3, 'X', 'test user')
      expect(@board.has_no_winner).to be(false), 'game is not over (horizontal)'
    end
    it 'checks if the game is over with vertical alignement' do
      @board.update(1, 'O', 'test user')
      @board.update(4, 'O', 'test user')
      @board.update(7, 'O', 'test user')
      expect(@board.has_no_winner).to be(false), 'game is not over (vertical)'
    end
    it 'checks if the game is over with diagonal alignement' do
      @board.update(1, 'X', 'test user')
      @board.update(5, 'X', 'test user')
      @board.update(9, 'X', 'test user')
      expect(@board.has_no_winner).to be(false), 'game is not over (diagonal)'
    end
  end
  describe '#draw?' do
    it 'checks whether there is a draw or not' do
      @board.moves = 0
      expect(@board.draw?).to be true
    end
  end
  describe '#not_over?' do
    it 'checks whether the game is over or not' do
      puts @board.has_no_winner
      @board.has_no_winner = false
      expect(@board.not_over?).to be false
    end
  end
end
