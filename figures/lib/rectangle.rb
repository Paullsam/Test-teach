class Rectangle < Figure
  def initialize(side1, side2)
    @side1, @side2 = side1, side2
  end

  def area
    @side1 * @side2
  end

  def sides
    [@side1, @side1, @side2, @side2]
  end

  def b_radius
    Math.sqrt(@side1 ** 2 + @side2 ** 2) / 2
  end
end
