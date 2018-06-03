class Parallelepiped < SolidFigure
  def initialize(side1, side2, height)
    @side1, @side2, @height = side1, side2, height
  end

  def base_perimeter
    @base_perimeter ||= (@side1 + @side2) * 2
  end

  def base_area
    @base_area ||= @side1 * @side2
  end

  def area
    (base_perimeter * @height) + (2 * base_area)
  end

  def volume
    base_area * @height
  end
end
