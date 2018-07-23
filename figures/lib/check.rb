module Check
  class Error < StandardError; end

  private
  def checking(some)
    unless some.is_a? Figure
      raise Check::Error, "'#{some.inspect}' should be type of Figure"
    end
  end
end
