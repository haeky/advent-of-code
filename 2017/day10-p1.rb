lengths = "18,1,0,161,255,137,254,252,14,95,165,33,181,168,2,188".split(',').map(&:to_i)
inputs = (0..255).to_a

skip = 0
position = 0

lengths.each do |length|
  unless length.zero?
    inputs.rotate!(position)
    inputs = inputs[0..(length - 1)].reverse + inputs[length..inputs.length]
    inputs.rotate!(-position)
  end

  position += length + skip
  if position >= inputs.length
    position -= inputs.length
  end

  skip += 1
end

puts inputs[0..1].inject(:*)
