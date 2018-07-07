class FiguresCollection

  def initialize
    @collection = []
  end

  def add(figure_type)
    collection << figure_type
  end

  def sorted_collection
    collection.sort{ |a, b| a.area <=> b.area }
  end

  def all
    collection
  end

  def max
    sorted_collection.last
  end

  def min
    sorted_collection.first
  end

  def sort
    @newcollection = FiguresCollection.new
    @newcollection = self.sorted_collection
  end

  def sort!
    self.sorted_collection
  end

  def group_by_type
    collection.group_by { |figure_type| figure_type.class }
  end

  private
    attr_reader :collection
end

require 'figure'
