require 'json'
input = JSON.parse(File.read("#{__FILE__.split('-').first}.txt"))

def iterate(object)
  case object
  when Hash
    object.values.include?("red") ? 0 : iterate(object.values)
  when Array
    object.map { |v| iterate(v) }.inject(:+)
  else
    object.to_i
  end
end
p iterate(input)
