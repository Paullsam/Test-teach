class FiguresCollection

  def initialize
    @collection = []
  end

  def add(figure)
    collection << figure
  end

  def all
    collection
  end

  def max
    collection.max
  end

  def min
    collection.min
  end

  def sort
    @newcollection = FiguresCollection.new
    collection.map { |figure| @newcollection.add(figure) }
    @newcollection.sort!
  end

  def sort!
    collection.sort!
    self
  end

  def group_by_type
    collection.group_by { |figure| figure.class }
  end

  private
    attr_reader :collection
end

require 'figure'
