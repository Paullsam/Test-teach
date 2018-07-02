class FiguresCollection < Figure

  def collection
    @collection = []
  end

  def add(figure_type)
    collection << figure_type
  end

  def all
    collection
  end

  def max
    collection.map{ |figure_type| figure_type.area }.max
  end

  def min
    collection.map{ |figure_type| figure_type.area }.min
  end

  def sort
    collection.sort
  end

  def sort!
    collection.sort!
  end

  def group_by_type
    collection.group_by{ |figure_type| figure_type.class }
  end
end
