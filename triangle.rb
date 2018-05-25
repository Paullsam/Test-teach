class Figure

  def area
    @side1 * @side2
  end	

  def perimeter
    (@side1 + @side2) * 2
  end
  
end
  
class Rectangle < Figure
    
  def initialize(side1, side2)
    @side1, @side2 = side1, side2
  end
   
end

class Square < Figure

  def initialize(side)
    @side1, @side2 = side, side 
  end
  
end

class Triangle < Figure
  
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

  
=begin
  def initialize(side1, side2, side3, angle1, angle2)
    @side1, @side2, @side3, @angle1, @angle2 = side1, side2, side3, angle1, angle2
  end

 if side1 > 0 and side2 > 0 and side3 > 0
    area = Triangle.tree_side_triangle_area
 elsif side1 > 0 and side2 > 0 and angle1 > 0
    area = Triangle.two_side_angle_triangle_area
 elsif side1 > 0 and angle1 > 0 and angle2 > 0
    area = Triangle.two_angle_side_triangle_area
 else 
    raise "Введите корректные данные"
 end
=end	
	
end

r = Rectangle.new(3, 4)
puts r.area
puts r.perimeter

s = Square.new(5)
puts s.area
puts s.perimeter

t = Triangle.new
puts t.tree_side_triangle_area(side1: 4, side2: 4, side3: 5)

