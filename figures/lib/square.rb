class Square < Rectangle
  def initialize(side)
    @side1, @side2 = side, side
  end

  def m_radius
    @side1 / 2.0
  end

  def b_radius
    @side1 / Math.sqrt(2.0)
  end
end
