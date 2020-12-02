input = File.read("#{__FILE__.split('-').first}.txt").split("\n")

results = input.map do |row|
  match = row.match(/(?<min>\d+)-(?<max>\d+)\s(?<letter>[a-z]):\s(?<password>\w+)/)

  min, max = match.values_at(:min, :max).map(&:to_i)
  letter, password = match.values_at(:letter, :password)

  password.count(letter).between?(min, max)
end

puts results.count(true)
