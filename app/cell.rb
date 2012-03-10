class Cell
  attr_reader :world, :x, :y
  def initialize(world, x, y)
    @world, @x, @y = world, x, y
    @live = false
  end

  def dead?
    !@live
  end

  def dead!
    @live = false
  end

  def live?
    @live
  end

  def live!
    @live = true
  end

  def toggle!
    @live = !@live
  end

  def neighbours
    neighbours = []
    neighbours.push(@world.cell_at(self.x - 1, self.y - 1))
    neighbours.push(@world.cell_at(self.x - 1, self.y))
    neighbours.push(@world.cell_at(self.x - 1, self.y + 1))

    neighbours.push(@world.cell_at(self.x, self.y - 1))
    neighbours.push(@world.cell_at(self.x, self.y + 1))

    neighbours.push(@world.cell_at(self.x + 1, self.y - 1))
    neighbours.push(@world.cell_at(self.x + 1, self.y))
    neighbours.push(@world.cell_at(self.x + 1, self.y + 1))

    neighbours
  end

  def live_neighbours
    self.neighbours.select do |n|
        n && n.live?
    end
  end
end
