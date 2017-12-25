state = :a
cursor = 0
tape = Array.new(10000, 0)

rules = {
  a: [
    [1, 1, :b],
    [0, -1, :b]
  ],
  b: [
    [1, -1, :c],
    [0, 1, :e]
  ],
  c: [
    [1, 1, :e],
    [0, -1, :d]
  ],
  d: [
    [1, -1, :a],
    [1, -1, :a]
  ],
  e: [
    [0, 1, :a],
    [0, 1, :f]
  ],
  f: [
    [1, 1, :e],
    [1, 1, :a]
  ]
}

12861455.times do
  x, y, z = if tape[cursor] == 0
    rules[state].first
  else
    rules[state].last
  end

  tape[cursor] = x
  cursor += y
  state = z
end

puts tape.inject(:+)
