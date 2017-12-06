inputs = if ARGV[0]
  ARGV[0].split(' ').map(&:to_i)
end

states = [];
state = inputs
steps = 0

while true
  steps += 1
  max_value = state.max
  distribution = if state.max > state.length
    (state.max / (state.length - 1)).floor
  else
    1
  end
  cursor = state.index(state.max)

  state = state.rotate(cursor).each_with_index.map do |bank, i|
    if i == 0
      state.length > max_value ? 0 : 1
    else
      i <= state.max ? distribution + bank : bank
    end
  end.rotate(cursor * -1)

  if states.include?(state)
    puts (steps - (states.index(state) + 1))
    exit
  else
    states << state
  end
end
