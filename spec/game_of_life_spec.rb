require './app/world'
require './app/cell'

describe "Conway's Game of Life" do
  let(:world) { World.new(5, 5) }
  context "respects first law: any live cell with fewer than two live neighbours dies, as if caused by under-population" do
    it "(with no live neighbours)" do
      cell = world.cell_at(0, 0)
      cell.live!
      world.next_generation!
      cell.should be_dead
    end

    it "(with one live neighbours)" do
      cell = world.cell_at(0, 0)
      cell.live!

      neighbour_cell = world.cell_at(0, 1)
      neighbour_cell.live!

      world.next_generation!
      cell.should be_dead

      neighbour_cell.should be_dead
    end
  end

  context "respects second law: any live cell with two or three live neighbours lives on to the next generation" do
    it '(with two live neighbours)' do
      cell = world.cell_at(2, 2)
      cell.live!

      cell_at_left = world.cell_at(1, 2)
      cell_at_left.live!

      cell_at_right = world.cell_at(3, 2)
      cell_at_right.live!

      world.next_generation!
      cell.should be_live
      cell_at_left.should be_dead
      cell_at_right.should be_dead
    end

    it "(with three live neighbours)" do
      cell = world.cell_at(2, 2)
      cell.live!

      cell_at_left = world.cell_at(1, 2)
      cell_at_left.live!

      cell_at_right = world.cell_at(3, 2)
      cell_at_right.live!

      cell_at_bottom = world.cell_at(2, 3)
      cell_at_bottom.live!

      world.next_generation!
      cell.should be_live
      cell_at_left.should be_live
      cell_at_right.should be_live
      cell_at_bottom.should be_live
    end
  end
end
