input = 'ugkiagan'
total = 0

128.times do |i|
  total += `ruby day10-p2.rb #{input}-#{i}`.chomp.to_i(16).to_s(2).count('1')
end

puts total
