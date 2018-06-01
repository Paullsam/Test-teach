class Cube
  def initialize(side)
    @side = side
  end

  def area
    @side**2 * 6
  end

  def capacity
    @side**3
  end
end
