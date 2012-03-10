require './app/world'
describe World do
  it 'initializes with width and heigth and generates dead cells' do
    world = World.new(6, 6)
    world.cells.length.should == 36
    world.cells.all?(&:dead?).should == true
  end

  it 'returns a cell at a x and y position' do
    world = World.new(3, 3)
    world.cell_at(0, 2).should == world.cells[2]
    world.cell_at(1, 0).should == world.cells[3]
  end
end
