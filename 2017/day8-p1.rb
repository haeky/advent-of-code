inputs = File.read(ARGV[0]).split("\n")

instructions = inputs.map do |i|
  variable = i.split(' ').first

  instance_variable_set("@#{variable}", 0)
  define_method(variable) do
    instance_variable_get("@#{variable}")
  end

  i.gsub('inc', '+=').gsub('dec', '-=').prepend('@')
end

instructions.each do |i|
  eval i
end

puts instance_variables.map { |i| instance_variable_get(i) }.max
