require 'pry'
rules = File.read('day21.txt').each_line.each_with_object({}) do |line, hash|
  x, y = line.match(/(.*) => (.*)/).captures
  hash[x.split('/')] = y.split('/')
end

grid = ['.#.', '..#', '###']

[5, 18].each do |iter|
  iter.times do
    slice = grid.size % 2 == 0 ? 2 : 3
    squares = grid.each_slice(slice).map { |x| x.map { |y| y.chars.each_slice(slice).map(&:join) }.transpose }.flatten(1)

    grid = squares.map do |square|
      rules[square] ||
        rules[square.reverse] ||
        rules[square.map(&:reverse)] ||
        rules[square.reverse.map(&:reverse)] ||
        rules[square.map(&:chars).transpose.map(&:join)] ||
        rules[square.map(&:chars).transpose.map(&:join).reverse] ||
        rules[square.map(&:chars).transpose.map(&:join).map(&:reverse)] ||
        rules[square.map(&:chars).transpose.map(&:join).reverse.map(&:reverse)]
    end

    grid = grid.each_slice(Math.sqrt(squares.size)).to_a.map(&:transpose).flatten(1).map(&:join)
  end

  puts grid.join.count('#')
end

