input = File.read('day5.txt').chomp

(input.size / 2).times do
  input.chars.each_cons(2).each_with_index do |(x, y), i|
    if x == y.swapcase
      input[i..i+1] = ''
      break
    end
  end
end

puts input.size
