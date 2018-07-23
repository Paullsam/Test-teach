module Check

  private
  def checking(some)
    unless some.is_a? Figure
      raise self.class::Error, "'#{some.inspect}' should be type of Figure"
    end
  end
end
