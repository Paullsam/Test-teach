class Circle < Figure
  def initialize(radius)
    @radius = radius
  end

  def perimeter
    2.0 * Math::PI * radius
  end

  def area
    Math::PI * radius ** 2
  end
end
