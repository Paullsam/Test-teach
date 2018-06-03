class Pyramid < Figure
  def initialize(height:, base:, side: nil, radius: nil)
    @height, @base, @side, @radius = height, base.to_s.upcase, side, radius
  end

  def area

    if @base == 'SQUARE'
      Square.new(@side).area + (sides.count * lateral_area)

    elsif @base == 'TRIANGLE'
      Triangle.new(@side, @side, @side).area + (sides.count * lateral_area)

    elsif @base == 'CIRCLE'
      Circle.new(@radius).area + (Math::PI * @radius * apothem)

    else raise Figure::Error, "Введите тип основания"
    end
  end

  def volume
    if @base == 'SQUARE'
      Square.new(@side).area  / 3.0

    elsif @base == 'TRIANGLE'
      Triangle.new(@side, @side, @side).area / 3.0

    elsif @base == 'CIRCLE'
      Circle.new(@radius).area / 3.0
  end

  def m_radius

    if sides.count = 4
      @side / 2.0

    elsif sides.count = 3
      (Math.sqrt(3.0) / 6.0) * @side
    else @radius
    end
  end

  def lateral_area
    (apothem * perimeter) / 2.0
  end

  def apothem
    Math.sqrt(m_radius**2 + @height**2)
  end
end
