input = File.read('day12.txt').chomp

@input = input.each_line.each_with_object({}) { |x, h| from, to = x.match(/(\d*)\s<->\s(.*)/).captures; h[from] = to.split(', ').map(&:to_i) }

def move(path, to)
  path.push(*to)

  to.each do |t|
    move(path, @input[t.to_s] - path)
  end

  path
end

path = move([0], @input[0.to_s])

puts path.size
