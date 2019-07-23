# frozen_string_literal: true

require_relative './../lib/player'
require 'stringio'

RSpec.describe Player do
  before { @player_1 = Player.new(1) }
  describe '#initialize' do
    it 'player_1 no should 1' do
      expect(@player_1.instance_variable_get(:@player_no)).to eq 1
    end
  end
  describe '#set_name' do
    before do
      $stdin = StringIO.new("Nike\n")
    end
    it 'name should be Nike' do
      expect(@player_1.set_name).to eq 'Nike'
    end
    after do
      $stdin = STDIN
    end
  end
  describe '#ask_side' do
    before do
      $stdin = StringIO.new("X\n")
    end
    it 'side should be X' do
      @player_1.side = Player.ask_side('Nike')
      expect(@player_1.side).to eq 'X'
    end
    after do
      $stdin = STDIN
    end
  end
end
