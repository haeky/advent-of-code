inputs = %w{43 3 4 10 21 44 4 6 47 41 34 17 17 44 36 31 46 9 27 38}
(2..10).inject(0) do |total, i|
  size = inputs.map(&:to_i).combination(i).find_all { |a| a.reduce(:+) == 150 }.size
  p size and break if size > 0
end
