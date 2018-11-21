# Function-oriented implementation:

def use_case
  step3(step2(step1))
end

def step1
  puts 'executing #step_1'
  # logic goes here...
  #
  # dynamic values retrieved from step's business logic
  { success: true, value: '#step1 done', error: nil }
end

def step2(input)
  return input unless input[:success]
  puts 'executing #step_2'

  # logic goes here...

  { success: true, value: '#step2 done', error: nil }
end

def step3(input)
  return input unless input[:success]
  puts 'executing #step_3'

  # logic goes here...

  { success: true, value: '#step3 done', error: nil }
end

puts use_case
