inputs = File.read("#{__FILE__.split('-').first}.txt").each_line

class Ingredient
  PROPERTIES = [:capacity, :durability, :flavor, :texture]
  attr_accessor *PROPERTIES

  def initialize(capacity, durability, flavor, texture, calories)
    @capacity = capacity
    @durability = durability
    @flavor = flavor
    @texture = texture
  end

  def score(proprities, quantity)
    quantity
  end
end

ingredients = inputs.map do |input|
  Ingredient.new(*input.scan(/(-?\d+)/).flatten.map(&:to_i))
end

result = (0..100).to_a.permutation(ingredients.size).find_all { |a| a.reduce(:+) == 100 }.each_with_object({}) do |quantities, hash|
  hash[quantities] = Ingredient::PROPERTIES.map do |property|
    total = quantities.each_with_index.inject(0) do |total, (quantity, index)|
      total += ingredients[index].send(property) * quantity
    end

    total = 0 if total < 0
    total
  end.reduce(:*)
end

p result.values.max
