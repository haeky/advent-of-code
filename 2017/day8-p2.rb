inputs = File.read(ARGV[0]).split("\n")

max = 0
instructions = inputs.map do |i|
  variable = i.split(' ').first

  instance_variable_set("@#{variable}", 0)
  define_method(variable) do
    instance_variable_get("@#{variable}")
  end

  i.gsub('inc', '+=').gsub('dec', '-=').prepend('@')
end

instructions.each do |i|
  variable = i.split(' ').first
  eval i
  max = [max, eval(variable)].max
end

puts max
