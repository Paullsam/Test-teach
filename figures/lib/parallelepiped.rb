class Parallelepiped
  def initialize(side1, side2, height)
    @side1, @side2, @height = side1, side2, height
  end

  def bottom_perimeter
    @bottom_perimeter = (@side1 + @side2) * 2
  end

  def bottom_area
    @bottom_area = @side1 * @side2
  end

  def area
    if @side1 == @side2 == @height
      @side1**2 * 6

    else @side1 && side2 && @height
      (@bottom_perimeter * @height) + (2 * @bottom_area)
    end
  end

  def capacity
    if @side1 == @side2 == @height
      @side1**3

    else
      @side1 * @side2 * @height
    end
  end

require 'cube'
require 'parallelepiped'
