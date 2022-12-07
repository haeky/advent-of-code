input = File.read("day7.txt")

results = input.split("\n").each_with_object([["/"]]).each_with_object(Hash.new(0)) do |(line, cwd), directories|
  case line
  when /cd \.\./
    cwd.pop
  when /cd (\w+)/
    cwd << cwd.last + [$1]
  when /^(\d+)/
    cwd.each do |directory|
      directories[directory] += $1.to_i
    end
  end
end

puts results.values.reject { |v| v >= 100_000 }.sum
puts results.values.select { |v| v >= 30_000_000 - (70_000_000 - results[["/"]]) }.min
