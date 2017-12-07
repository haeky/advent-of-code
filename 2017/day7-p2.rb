inputs = File.read(ARGV[0]).split("\n")

Hash[inputs.map do |i|
  name, weight, childrens = i.match(/([a-z]*)\s\(([0-9]*)\)(\s->\s)?(.*)?/).values_at(1, 2, 4)

  define_method(name) do
    return weight.to_i if childrens.nil?

    childrens.split(', ').map { |c| send(c).to_i }.inject(:+).to_i + weight.to_i
  end

  define_method("#{name}_weight") do
    return weight
  end

  define_method("#{name}_childrens") do
    return childrens.split(', ')
  end

  [name, childrens.to_s.split(', ')]
end]

def balanced?(node)
  childrens = send("#{node}_childrens")

  sums = childrens.map { |x| send(x) }
  difference = sums.uniq.sort.inject(:-).abs

  return true if sums.uniq.one?

  unbalanced_node = childrens[sums.index(sums.max)]

  if balanced?(unbalanced_node)
    puts send("#{unbalanced_node}_weight").to_i - difference
    exit;
  end
end

top_node = `ruby day7-p1.rb #{ARGV[0]}`.chomp
balanced?(top_node)

puts 'potato'
