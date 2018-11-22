# Object-oriented implementation:
# visit ChainIt gem: https://github.com/tier-tools/chainit

Result = Struct.new(:success, :value) do
  def success?
    success
  end
end

class ChainIt
  def chain
    return self if @skip
    @result = yield @result&.value
    @skip = true unless @result.success?
    self
  end

  def result
    @result
  end
end
