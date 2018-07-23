require 'check'

class Figure
  class Error < StandardError; end
  include Comparable, Check

  def <=>(other)
    checking(other)
    self.area <=> other.area
  end

  def perimeter
    sides.inject :+
  end

  def figure?
    false
  end
end

require 'rectangle'
require 'square'
require 'circle'
require 'triangle'
