class Figure
  class Error < StandardError; end
  include Comparable

  def <=>(other)
    unless other.is_a? Figure
      raise Figure::Error, "`#{other.inspect}` should be type of `Figure`"
    end

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
require 'figures_collection'
