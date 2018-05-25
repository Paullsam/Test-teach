class Triangle

 # def initialize(side1, side2, side3, angle1, angle2)
 #   @side1, @side2, @side3, @angle1, @angle2 = side1, side2, side3, angle1, angle2
 # end  
 
  def oneside_triangle_area(side1: 0)
    Math.sqrt(3) / 4 * (side1**2)
  end
  
  def tree_side_triangle_area(side1: 0, side2: 0, side3: 0)
    @p = (side1 + side2 + side3) / 2.0 
   Math.sqrt(@p * (@p - side1) * (@p - side2) * (@p - side3))
  end
  
  def two_side_angle_triangle_area(side1: 0, side2: 0, angle1: 0)
    (side1 * side2 * Math.sin(angle1)) / 2.0
  end
  
  def two_angle_side_triangle_area(side1: 0, angle1: 0, angle2: 0)
    @angle3 = 180 - (angle1 + angle2)
	(side1**2 / 2.0) * (Math.sin(angle1) * Math.sin(angle2) / Math.sin(@angle3))
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
	
end

t = Triangle.new
puts t.area(side1: 3, side2: 3, side3: 5)