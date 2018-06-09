class SolidFigure
  class Error < StandardError; end
  include Comparable

  def <=>(other)
    unless other.is_a? SolidFigure
      raise SolidFigure::Error, "`#{other.inspect}` should be type of `SolidFigure`"
    end

    self.volume <=> other.volume
  end
end

require 'parallelepiped'
require 'cube'
require 'prism'
require 'pyramid'
require 'figure'
