class Figure

  def <=>(other)
    unless other.is_a? Figure 
      raise "`#{other.inspect}` should be type of `Figure`"
    end

    self.area <=> other.area
  end

  def <(other)
    (self <=> other) == -1
  end

  def >(other)
    (self <=> other) == 1
  end

  def ==(other)
    (self <=> other) == 0
  end

  def !=(other)
    (self <=> other) != 0
  end

  def perimeter
    sides.inject :+
  end
end

class Rectangle < Figure
  def initialize(side1, side2)
    @side1, @side2 = side1, side2
  end

  def area
    @side1 * @side2
  end

  def sides
    [@side1, @side1, @side2, @side2]
  end
end

class Square < Rectangle
  def initialize(side)
    @side1, @side2 = side, side
  end
end

class Triangle < Figure

  def initialize(side1, side2, side3, angle1, angle2)
    @side1, @side2, @side3, @angle1, @angle2 = side1, side2, side3, angle1, angle2
   
   if @side1 > 0 and @side2 > 0 and @side3 > 0
    @p = (side1 + side2 + side3) / 2.0
   elsif @side1 > 0 and @angle1 > 0 and @angle2 > 0
    @side2 = (@side1 * Math.sin(@angle1)) / Math.sin(@angle2)
	@side3 = Math.sqrt(@side1**2 + @side2**2 - (2 * @side1 * @side2) * Math.cos(@angle1))
    @p = (side1 + side2 + side3) / 2.0
   elsif @side1 > 0 and @side2 > 0 and @angle1 > 0
    @side3 = Math.sqrt(@side1**2 + @side2**2 - (2 * @side1 * @side2) * Math.cos(@angle1))
    @p = (side1 + side2 + side3) / 2.0
   else 
    raise "Введите корректные данные"
   end
  end

  def area
    Math.sqrt(@p * (@p - @side1) * (@p - @side2) * (@p - @side3))
  end

  def sides
    [@side1, @side2, @side3]
  end

end

