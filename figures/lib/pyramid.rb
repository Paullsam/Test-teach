class Pyramid < SolidFigure
  def initialize(height:, base:, side: nil)
    @height, @base, @side = height, base.to_s.upcase, side
  end

  def base_object
    @base_object ||= case @base
    when "SQUARE"
      Square.new(@side)
    when "TRIANGLE"
      Triangle.new(side1: @side, side2: @side, side3: @side)
    when "CIRCLE"
      Circle.new(@side)
    else
      raise SolidFigure::Error, "Incorrect base type"
    end
  end

  def area
    base_object.area + lateral_area
  end

  def volume
    area / 3.0
  end

  def lateral_area
    (apothem * base_object.perimeter) / 2.0
  end

  def apothem
    Math.sqrt(base_object.m_radius ** 2 + @height ** 2)
  end
end
