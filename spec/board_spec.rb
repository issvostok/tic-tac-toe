require "spec_helper"

module TicTacToe
  describe Board do

    context "#initialize" do
      it "initializes the board with a grid" do
        expect { Board.new(grid: "grid") }.to_not raise_error
      end
    end

    it "sets the grid with three rows by default" do
      board = Board.new
      expect(board.grid.size).to eq(3)
    end

    it "creates three things in each row by default" do
      board = Board.new
      board.grid.each do |row|
        expect(row.size).to eq(3)
      end
    end

    context "#grid" do
      it "returns the grid" do
        board = Board.new(grid: "oneone")
        expect(board.grid).to eq "oneone"
      end
    end

    context "#get_cell" do
      it "returns the cell based on x, y coordinate" do
        grid = [['','',''],['','','smth'],['','','']]
        board = Board.new(grid: grid)
        expect(board.get_cell(2,1)).to eq "smth"
      end
    end

 end
end
