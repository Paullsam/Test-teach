class Prism < SolidFigure
  def initialize(height:, base:, side:)
    @height, @base, @side = height, base, side
  end

  def base_area
    base_object.area
  end

  def base_object
    @base_object ||= case @base
    when 'SQUARE'
      Square.new(@side)
    when 'TRIANGLE'
      Triangle.new(side1: @side, side2: @side, side3: @side)
    when 'CIRCLE'
      Circle.new(@side)
    else
      raise SolidFigure::StandardError, 'unkonwn base type'
    end
  end

  def area
    (base_object.perimeter * @height) + (2 * base_area)
  end

  def volume
    base_area * @height
  end
end
