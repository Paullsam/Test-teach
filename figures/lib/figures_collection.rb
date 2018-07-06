class FiguresCollection < Figure

  def initialize
    @collection = []
  end

  private
    attr_reader :collection
  end

  def add(figure_type)
    @figure_type = figure_type
    collection << @figure_type
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
    @collection := sorted_collection
  end

  def sort!
    sorted_collection
  end

  def group_by_type
    collection.group_by{ |figure_type| figure_type.class }
  end
end
