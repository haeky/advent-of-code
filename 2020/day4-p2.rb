input = File.read("#{__FILE__.split('-').first}.txt").split("\n\n").map { |row| row.split(/[\s\n]/).map { |fields| fields.split(':') }.to_h }

REQUIRED_FIELDS = {
  'byr' => Proc.new { |x| x.to_i.between?(1920, 2002) },
  'iyr' => Proc.new { |x| x.to_i.between?(2010, 2020) },
  'eyr' => Proc.new { |x| x.to_i.between?(2020, 2030) },
  'hgt' => Proc.new { |x| next false unless match = x.match(/(\d+)([a-z]+)/i); value, unit = match[1, 2]; unit == 'in' ? value.to_i.between?(59, 76) : value.to_i.between?(150, 193) },
  'hcl' => Proc.new { |x| !!(x =~ /#[a-f0-9]{6}/) },
  'ecl' => Proc.new { |x| %w(amb blu brn gry grn hzl oth).include?(x) },
  'pid' => Proc.new { |x| !!(x =~ /^[0-9]{9}$/) },
}

results = input.map do |passport|
  next false unless (passport.keys.sort - ['cid']) == REQUIRED_FIELDS.keys.sort

  passport.reject { |k, _| k == 'cid' }.all? do |key, value|
    REQUIRED_FIELDS[key].call(value)
  end
end

puts results.count(true)
