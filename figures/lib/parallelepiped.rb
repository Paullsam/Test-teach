class Parallelepiped
  def initialize(side1:, side2:, edge: nil, height: nil)
    @side1, @side2, @edge, @height = side1, side2, edge, height
  end

  def bottom_perimeter
    @bottom_perimeter = (@side1 + @side2) * 2
  end

  def bottom_area
    @bottom_area = @side1 * @side2
  end

  def area
    if @side1 == @side2 == @edge ||  @side1 == @side2 == @height
      @side1**2 * 6

    elsif @side1 && side2 && @height
      (@bottom_perimeter * @height) + (2 * @bottom_area)

    elsif @side1 && side2 && @edge
      2 * (@side1 * @side2 + @side1 * @edge + @side2 * @edge)
    end
  end

  def capacity
    if @side1 == @side2 == @edge ||  @side1 == @side2 == @height
      @side1**3

    elsif @side1 && side2 && @height
      @bottom_area * @height

    elsif @side1 && side2 && @edge
      @side1 * @side2 * @edge
    end
  end
