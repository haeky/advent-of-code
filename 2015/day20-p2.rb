INPUT = 29_000_000

class Integer
  def factors
    1.upto(Math.sqrt(self)).select {|i| (self % i).zero?}.inject([]) do |f, i|
      f << self/i unless i == self/i
      f << i
    end.sort
  end
end

(1..1_000_000).each do |index|
  if index.factors.select { |i| i * 50 >= index }.map { |i| i * 11 }.reduce(:+) >= INPUT
    p index
    exit
  end
end

