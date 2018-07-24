require 'check'

class FiguresCollection
  class Error < StandardError; end
  include Check

  def initialize
    @collection = []
  end

  def add(figure)
    checking(figure)
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
    create_collection(collection).sort!
  end

  def sort!
    collection.sort!
    self
  end

  def group_by_type
    group =  collection.group_by { |figure| figure.class }
    new_group = { }
    group.each { |key, value| new_group[key] = create_collection(value) }
    new_group
  end

  def each(&block)
    for i in 0..(collection.length - 1)
      block.call(collection[i])
    end
  end

  def map(&block)
    new_collection = []
      for i in 0..(collection.length - 1)
        new_collection << block.call(collection[i])
      end
    new_collection
  end

  private
    attr_reader :collection

    def create_collection(array)
      new_fig_collection = FiguresCollection.new
      array.each { |figure| new_fig_collection.add(figure) }
      new_fig_collection
    end
end
