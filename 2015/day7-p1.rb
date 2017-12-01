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
File.read("#{__FILE__.split('-').first}.txt").each_line do |line|
  circuit.add_method(line)
end

p circuit.a_
