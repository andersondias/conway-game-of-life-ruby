require './app/cell'
require './app/world'

describe Cell do
  let(:world) { World.new(5, 5) }

  it 'belongs to a world' do
    cell = Cell.new(world, 0, 0)
    cell.world == world
  end

  it 'initializes with x and y coordinates in the world' do
    cell = Cell.new(world, 0, 1)
    cell.x.should == 0
    cell.y.should == 1
  end

  it 'initializes as dead' do
    cell = Cell.new(world, 0, 0)
    cell.should be_dead
    cell.should_not be_live
  end

  it 'should be set as alive' do
    cell = Cell.new(world, 0, 0)
    cell.live!
    cell.should be_live
    cell.should_not be_dead
  end

  it 'should be set as dead' do
    cell = Cell.new(world, 0, 0)
    cell.live!

    cell.dead!
    cell.should be_dead
    cell.should_not be_live
  end

  it 'should toggle between live and dead' do
    cell = Cell.new(world, 0, 0)
    cell.toggle!
    cell.should be_live
    cell.toggle!
    cell.should be_dead
  end

  it 'has neighbours' do
    cell = world.cell_at(1, 1)
    neighbours = cell.neighbours
    neighbours.should include(world.cell_at(0, 0))
    neighbours.should include(world.cell_at(0, 1))
    neighbours.should include(world.cell_at(0, 2))

    neighbours.should include(world.cell_at(1, 0))
    neighbours.should include(world.cell_at(1, 2))

    neighbours.should include(world.cell_at(2, 0))
    neighbours.should include(world.cell_at(2, 1))
    neighbours.should include(world.cell_at(2, 2))
    neighbours.length.should == 8
  end

  it 'returns the live neighbours' do
    cell = world.cell_at(1, 1)
    right_bottom_cell = world.cell_at(2, 2)
    right_bottom_cell.live!
    bottom_cell = world.cell_at(2, 1)
    bottom_cell.live!

    live_neighbours = cell.live_neighbours
    live_neighbours.length.should == 2
    live_neighbours.should include(right_bottom_cell)
    live_neighbours.should include(bottom_cell)
  end
end
