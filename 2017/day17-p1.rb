input = ARGV[0].to_i

tornado = [0]

2017.times do |i|
  tornado.rotate!(input)
  tornado << i.next
end

puts tornado.first
