class Rectangle
    
  def rectangle_area(side1: nil, side2: nil)
    side1 * side2
  end
  
  def square_area(side: nil)
    side**2
  end
  
  # методы для треугольника
      
  def oneside_triangle_area(side1: nil)
    Math.sqrt(3) / 4 * (side1**2)
  end
  
  def tree_side_triangle_area(side1: nil, side2: nil, side3: nil)
    @p = (side1 + side2 + side3) / 2.0 
   Math.sqrt(@p * (@p - side1) * (@p - side2) * (@p - side3))
  end
  
  def two_side_angle_triangle_area(side1: nil, side2: nil, angle1: nil)
    (side1 * side2 * Math.sin(angle1)) / 2.0
  end
  
  def two_angle_side_triangle_area(side1: nil, angle1: nil, angle2: nil)
    @angle3 = 180 - (angle1 + angle2)
	(side1**2 / 2.0) * (Math.sin(angle1) * Math.sin(angle2) / Math.sin(@angle3))
  end
  
end

class Square < Rectangle
  
  
end

class Triangle < Rectangle
  
  
end


r = Rectangle.new
puts r.rectangle_area(side1: 3, side2: 4)

s = Square.new
puts s.square_area(side: 5)

t = Triangle.new
puts t.two_side_angle_triangle_area(side1: 6, side2: 3, angle1: 30)

