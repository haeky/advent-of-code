@inputs = File.read('day24.txt').each_line.map { |line| line.chomp.split('/').map(&:to_i) }
@max = 0
@max_longuest = 0
@longuest = 0

def match(bridge, port_a)
  (@inputs - bridge.each_slice(2).to_a).select { |x| x.include?(port_a) }.each do |component|
    port_b = component.find.with_index { |_, i| i != component.index(port_a) }
    new_bridge = bridge + component
    bridge_size = new_bridge.inject(:+)

    if new_bridge.size >= @longuest
      @longuest = new_bridge.size
      @max_longuest = [@max_longuest, bridge_size].max
    else
      @max = [@max, bridge_size].max
    end

    match(new_bridge, port_b)
  end
end

bridges = @inputs.select { |i| i.include?(0) }
bridges.each do |b|
  match(b, (b - [0]).first)
end

p "Max: #{@max}"
p "Longuest: #{@max_longuest}"
