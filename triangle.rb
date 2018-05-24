class Figure
  
  def initialize(side1, side2)
    @side1, @side2 = side1, side2
  end
  
  #  attr_accessor :side1, :side2

  def area
    @side1 * @side2
  end

end

class Rectangle < Figure
  
end

class Square < Figure

  def initialize(side1, side2 = side1)
    @side1, @side2 = side1, side2
  end
  
end

class Triangle < Figure

  def initialize(side1, side2 = side1, side3 = side1)
	@side1, @side2, @side3 = side1, side2, side3
  end
  
  def area
    Math.sqrt(3) / 4 * (@side1**2)
 #  @p = (@side1 + @side2 + @side3) / 2 
 #	Math.sqrt(@p * (@p - @side1) * (@p - @side2) * (@p - @side3))
  end
    
end


r = Rectangle.new(3, 4)
puts r.area

s = Square.new(5)
puts s.area

t = Triangle.new(6, 3, 4)
puts t.area