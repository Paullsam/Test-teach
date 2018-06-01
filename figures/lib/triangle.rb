class Triangle < Figure
  def initialize(side1:, side2: nil, side3: nil, angle1: nil, angle2: nil)
    @side1, @side2, @side3, @angle1, @angle2 = side1, side2, side3, angle1, angle2

    if @side1 && @side2 && @side3
      angles

    elsif @side1 && @angle1 && @angle2
      @side2 = (@side1 * Math.sin(@angle1)) / Math.sin(@angle2)
      @side3 = find_side3
      @angle3 = find_angle3

    elsif @side1 && @side2 && @angle1
      @side3 = find_side3
      angles
    else
      raise Figure::Error, "Введите корректные данные"

    unless 3.times.map { |i| sides.rotate(i) }.all? { |(s1, s2, s3)| s1 + s2 > s3 }
      raise Figure::Error, "Неправильный треугольник"
    end
  end

  def area
    Math.sqrt(sides.inject(p) { |result, x|  result * (p - x) })
  end

  def sides
    [@side1, @side2, @side3]
  end

  def angles
    3.times.map { |i| sides.rotate(i) }.map { |(s1, s2, s3)| (Math.acos((s1**2 + s2**2 - s3**2) / (2.0 * s1 * s2))) * (180.0 / Math::PI) }
  end

  private

  def p
    @p ||= perimeter / 2.0
  end

  def find_side3
    Math.sqrt(@side1**2 + @side2**2 - (2 * @side1 * @side2) * Math.cos(@angle1))
  end

  def find_angle3
    @angle3 = 180.0 - (@angle1 + @angle2)
  end
end
