class Monkey
  attr_accessor :items, :operation, :division, :truthy, :falsy, :inspections

  def initialize(monkeys)
    @monkeys = monkeys
    @items = []
    @inspections = 0
  end

  def execute(relief: true)
    items.each do |item|
      @inspections += 1

      value = (eval operation.gsub(/old/, item.to_s))
      value = if relief
        value / 3
      else
        value % @monkeys.map(&:division).inject(:*)
      end
      @monkeys[value % division == 0 ? truthy : falsy].items << value
    end

    @items = []
  end
end

input = File.read("day11.txt").split("\n\n")
monkeys = []

input.each_with_index do |monkey, index|
  monkey.split("\n").each do |line|
    case line
    when /Starting items: (.*)/
      monkeys[index] = Monkey.new(monkeys)
      monkeys[index].items = $1.split(",").map(&:to_i)
    when /Operation: new = (.*)/
      monkeys[index].operation = $1
    when /Test: divisible by (\d+)/
      monkeys[index].division = $1.to_i
    when /If (true|false): throw to monkey (\d+)/
      monkeys[index].public_send("#{$1 == 'true' ? :truthy : :falsy}=", $2.to_i)
    end
  end
end

# Part 1
20.times do
  monkeys.each { |monkey| monkey.execute(relief: true) }
end

p monkeys.map(&:inspections).max(2).inject(:*)
# Part 2

10000.times do
  monkeys.each { |monkey| monkey.execute(relief: false) }
end

p monkeys.map(&:inspections).max(2).inject(:*)
