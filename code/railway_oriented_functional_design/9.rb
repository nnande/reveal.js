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

def step1
  puts 'executing #step_1'
  Result.new(true, '#step1 done')
end

def step2
  puts 'executing #step_2'
  Result.new(true, '#step2 done')
end

def step3
  puts 'executing #step_3'
  Result.new(true, '#step3 done')
end
