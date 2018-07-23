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

  private
    attr_reader :collection

  protected
    def create_collection(array)
      new_collection = FiguresCollection.new
      array.each { |figure| new_collection.add(figure) }
      new_collection
    end
end
