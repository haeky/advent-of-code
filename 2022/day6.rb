input = File.read("day6.txt")

results = [4, 14].map do |size|
  input.chars.each_cons(size).find_index do |marker|
    marker.uniq.size == size
  end + size
end

puts results
