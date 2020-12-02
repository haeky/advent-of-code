input = File.read("#{__FILE__.split('-').first}.txt").split("\n")

results = input.map do |row|
  match = row.match(/(?<min>\d+)-(?<max>\d+)\s(?<letter>[a-z]):\s(?<password>\w+)/)

  x, y = match.values_at(:min, :max).map(&:to_i).map(&:pred)
  letter, password = match.values_at(:letter, :password)

  password.split('').values_at(x,  y).count(letter) == 1
end

puts results.count(true)
