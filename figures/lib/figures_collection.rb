class FiguresCollection
  class Error < StandardError; end

  def initialize
    @collection = []
  end

  def add(figure)
    unless figure.is_a? Figure
      raise FiguresCollection::Error, "'#{figure.inspect}' shoud be type of Figure"
    end

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
    new_collection = FiguresCollection.new
    collection.each { |figure| new_collection.add(figure) }
    new_collection.sort!
  end

  def sort!
    collection.sort!
    self
  end

  def group_by_type
    group =  collection.group_by { |figure| figure.class }
    new_group = { }

    group.each do |key, value|
      new_collection = FiguresCollection.new
      value.each { |figure| new_collection.add(figure) }
      new_group[key] = new_collection
    end
    new_group
  end

  private
    attr_reader :collection
end

require 'figure'
