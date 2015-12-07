class Circuit
  OPERATORS = {
    'AND' => '&',
    'OR' => '|',
    'NOT' => '~',
    'RSHIFT' => '>>',
    'LSHIFT' => '<<'
  }

  def add_method(instruction)
    operation, key = instruction.gsub(Regexp.union(OPERATORS.keys), OPERATORS).scan(/(.*) -> (.*)/).first
    instance_eval "def #{key}_; @#{key}_ ||= #{operation.gsub(/([a-z]+)/, "\\1_")}; end"
  end
end

circuit = Circuit.new
circuit.add_method("a -> b")
File.read("#{__FILE__.split('-').first}.txt").gsub("44430 -> b", "3176 -> b").each_line do |line|
  circuit.add_method(line)
end

p circuit.a_
