input = ARGF.read.chars.map(&:to_i).each_slice(2).each_with_index.each_with_object([]) do |((file, space), index), disk|
  disk << [index] * file
  disk << ["."] * space
end

def checksum(disk)
  disk.each_with_index.inject(0) { |acc, (value, index)| acc += value == "." ? 0 : value * index }
end

def part1(input)
  disk = input.dup.flatten

  disk.count { |v| v.is_a?(Integer) }.times do |index|
    char = disk[index]
    next unless char == "."
    x = disk.rindex { |c| c.is_a?(Integer) }
    disk[index], disk[x] = disk[x], disk[index]
  end

  disk
end

def part2(input)
  disk = input.dup

  disk.select.with_index { |_, i| i.even? }.reverse_each do |block|
    (disk.size - 1).times do |i|
      next unless disk[i].uniq.join == "."
      next unless disk[i].size >= block.size

      disk[i] = disk[i].drop(block.size)
      disk.insert(i, block)
      disk[disk.rindex { |b| b == block }] = ["."] * block.size
      break
    end
  end

  disk.flatten
end

puts "Part 1: #{checksum(part1(input))}"
puts "Part 2: #{checksum(part2(input))}"
