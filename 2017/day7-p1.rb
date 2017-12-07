inputs = File.read(ARGV[0]).split("\n")

rows = Hash[inputs.map do |i|
  x, y = i.split(' -> ')
  [x.split(' ').first, y.to_s.split(', ')]
end]

rows.each do |x, _|
  unless rows.values.compact.flatten.include?(x)
    puts x
    exit;
  end
end
