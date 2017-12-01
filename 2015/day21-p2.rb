class Item
  attr_reader :name, :cost, :damage, :defense

  def initialize(name, cost, damage, defense)
    @name = name
    @cost = cost
    @damage = damage
    @defense = defense
  end
end

class Weapon < Item; end;
class Armor < Item; end;
class Ring < Item; end;

weapons = [
  Weapon.new("Dagger", 8, 4, 0),
  Weapon.new("Shortsword", 10, 5, 0),
  Weapon.new("Warhammer", 25, 6, 0),
  Weapon.new("Longsword", 40, 7, 0),
  Weapon.new("Greataxe", 74, 8, 0)
]

armors = [
  Armor.new("Nothing", 0, 0, 0),
  Armor.new("Leather", 13, 0, 1),
  Armor.new("Chainmail", 31, 0, 2),
  Armor.new("Splintmail", 53, 0, 3),
  Armor.new("Bandedmail", 75, 0, 4),
  Armor.new("Platemail", 102, 0, 5)
]

rings = [
  Ring.new("Nothing", 0, 0, 0),
  Ring.new("Nothing", 0, 0, 0),
  Ring.new("Damage +1", 25, 1, 0),
  Ring.new("Damage +2", 50, 2, 0),
  Ring.new("Damage +3", 100, 3, 0),
  Ring.new("Defense +1", 20, 0, 1),
  Ring.new("Defense +2", 40, 0, 2),
  Ring.new("Defense +3", 80, 0, 3)
]

HERO_HEALTH = 100.0
BOSS_HEALTH = 103.0
BOSS_DAMAGE = 9.0
BOSS_DEFENSE = 2.0

result = weapons.product(armors, rings, rings).each_with_object([]) do |items, costs|
  next if items[2] == items[3]
  cost = items.reduce(0) { |t, x| t += x.cost }
  damage = items.reduce(0) { |t, x| t += x.damage }
  defense  = items.reduce(0) { |t, x| t += x.defense }

  hero_damage = [1, damage - BOSS_DEFENSE].max
  boss_damage = [1, BOSS_DAMAGE - defense].max

  if (HERO_HEALTH / boss_damage).ceil <= (BOSS_HEALTH / hero_damage).ceil
    costs << cost
  end
end

p result.max
