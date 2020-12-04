input = File.read("#{__FILE__.split('-').first}.txt").split("\n\n").map { |row| row.split(/[\s\n]/).map { |fields| fields.split(':') }.to_h }

REQUIRED_FIELDS = %w(
  byr
  iyr
  eyr
  hgt
  hcl
  ecl
  pid
).sort

OPTIONAL_FIELDS = %w(
 cid
)

results = input.map do |passport|
  (passport.keys.sort - OPTIONAL_FIELDS) == REQUIRED_FIELDS
end

puts results.count(true)
