class FiguresCollection < Figure

  def collection
    @collection = Hash.new
  end

  def add(figure_type)
    collection.merge!( { "#{figure_type}" => figure_type.area } )
  end

  def all
    collection.values
  end

  def max
    collection.values.max
  end

  def min
    collection.values.min
  end

  def sort
    @collection = collection.sort{ |a, b| a[1] <=> b[1] }.to_h
  end

  def sort!
    collection.sort{ |a, b| a[1] <=> b[1] }
  end

  def group_by_type
    collection.group_by{ |figure_type| figure_type[0] }
  end
end
