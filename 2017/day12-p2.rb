input = File.read('day12.txt').chomp

@input = input.each_line.each_with_object({}) { |x, h| from, to = x.match(/(\d*)\s<->\s(.*)/).captures; h[from] = to.split(', ').map(&:to_i) }

def move(path, to)
  path.push(*to)

  to.each do |t|
    move(path, @input[t.to_s] - path)
  end

  path
end

paths = []

until @input.empty?
  from, to = @input.first

  paths << move([from.to_i], to)

  @input.delete_if { |k| paths.flatten.include?(k.to_i) }
end

puts paths.size
