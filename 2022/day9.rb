input = File.read("day9.txt").split("\n").map(&:split)

MOVES = {
  "R" => [+1, 0],
  "L" => [-1, 0],
  "U" => [0, +1],
  "D" => [0, -1]
}

def execute(instructions, length)
  movements = [[0, 0]]

  rope = length.times.map do
    [0, 0]
  end

  instructions.each do |direction, amount|
    amount.to_i.times do
      head, *knots = rope
      rope[0] = [head, MOVES[direction]].transpose.map(&:sum)

      knots.each.with_index(1) do |knot, index|
        distances = rope[index-1].zip(rope[index]).map { |points| points.reduce(:-) }
        if distances.any? { |d| d.abs > 1 }
          move = distances.map { |i| i == 0 ? 0 : (i > 0 ? +1 : -1) }
          rope[index] = [knot, move].transpose.map(&:sum)

          movements << rope[index] if index == rope.length - 1
        end
      end
    end
  end

  movements.uniq.count
end

p execute(input, 2)
p execute(input, 10)
