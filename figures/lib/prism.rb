class Prism < SolidFigure
  def initialize(height:, base:, side:)
    @height, @base, @side = height, base, side
  end

  def base_area
    base_obj.area
  end

  def base_obj
    @base_obj ||= case @base
    when 'SQUARE'
      Square.new(@side)
    when 'TRIANGLE'
      Triangle.new(@side)
    when 'CIRCLE'
      Circle.new(@side)
    else
      raise SolidFigure::StandardError, 'unkonwn base type'
    end
  end

  def volume
    base_area * @height
  end
end

require 'figure'
