original_input = File.read('day5.txt').chomp

result = ('a'..'z').each_with_object({}) do |letter, letters|
  puts "Working on letter '#{letter}'"
  input = original_input.dup.tr([letter, letter.upcase].join, '')

  (input.size / 2).times do
    input.chars.each_cons(2).each_with_index do |(x, y), i|
      if x == y.swapcase
        input[i..i+1] = ''
        break
      end
    end
  end

  letters[letter] = input.size
end

puts result.min_by { |_, v| v }.last
