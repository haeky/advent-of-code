class Node
  attr_accessor :value, :before, :after

  def initialize(value, before = self, after = self)
    @value = value
    @before = before
    @after = after
  end

  def insert_after(value)
    new_node = Node.new(value, self, @after)

    @after.before = new_node
    @after = new_node

    new_node
  end

  def delete
    @before.after = @after
    @after.before = @before

    @after
  end

  def print
    node = self
    output = []

    begin
      node = node.after
      output << node.value
    end while node != self

    output.rotate(output.index(0))
  end
end

def find_highscore(players, last_marble)
  new_marble = 0
  current_node = Node.new(new_marble)
  scores = Array.new(players, 0)

  while current_node.value < last_marble
    new_marble += 1

    if new_marble % 23 == 0
      node  = current_node.before.before.before.before.before.before.before
      scores[new_marble % players] += node.value + new_marble
      current_node = node.delete
    else
      current_node = current_node.after.insert_after(new_marble)
    end
  end

  scores.max
end

puts find_highscore(410, 72059)
puts find_highscore(410, 72059 * 100)
