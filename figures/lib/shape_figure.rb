class ShapeFigure
  class Error < StandardError; end
  include Comparable

  def <=>(other)
    unless other.is_a? ShapeFigure
      raise ShapeFigure::Error, "`#{other.inspect}` should be type of `ShapeFigure`"
    end

    self.area <=> other.area
  end

  def perimeter
    sides.inject :+
  end

  def ShapeFigure?
    false
  end
end

class BaseSqure < ShapeFigure
  def initialize(side)
    @side = side
  end

  def area
    @side**2
  end

  def sides
    [@side, @side, @side, @side]
  end
end

class BaseCircle < ShapeFigure
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

class BaseTriangle < ShapeFigure
  def initialize(side)
    @side1 = @side2 = @side3 = side
  end

  def area
    Math.sqrt(sides.inject(p) { |result, x|  result * (p - x) })
  end

  def sides
    [@side1, @side2, @side3]
  end

  private

  def p
    @p ||= perimeter / 2.0
  end
end
