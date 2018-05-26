class Triangle
  
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

t = Triangle.new(4, 8, 0, 35, 70)
puts t.area
puts t.sides
