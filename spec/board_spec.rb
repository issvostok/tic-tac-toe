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

    context "#set_cell" do
      it "updates the value of the cell object at a (x,y) coordinate" do
        Cat = Struct.new(:value)
        grid = [[Cat.new("cool"), "", ""], ["", "", ""], ["", "", ""]]
        board = Board.new(grid: grid)
        board.set_cell(0, 0, "meow")
        expect(board.get_cell(0, 0).value).to eq "meow"
      end
    end

    context "#game_over" do
  it "returns :winner if winner? is true" do
    board = Board.new
    board.stub(:winner?) { true }
    expect(board.game_over).to eq :winner
  end

  it "returns :draw if winner? is false and draw? is true" do
    board = Board.new
    board.stub(:winner?) { false }
    board.stub(:draw?) { true }
    expect(board.game_over).to eq :draw
  end

  it "returns false if winner? is false and draw? is false" do
    board = Board.new
    allow(board).to receive(:winner?) { false }
    allow(board).to receive(:draw?) { false }
    expect(board.game_over).to be_falsey
  end
end

 end
end
