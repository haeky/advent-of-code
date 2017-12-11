input = if ARGV[0]
  ARGV[0]
else
  File.read('day11.txt').chomp
end.split(',')

class Position
  attr_accessor :x, :y, :furthest

  def initialize
    @furthest = 0
    @x = 0
    @y = 0
  end

  def follow!(movements)
    movements.each do |m|
      move(m)
    end
  end

  def distance
    (x.abs + y.abs) / 2
  end

  private

  def move(movement)
    case movement
    when 'nw'
      @x -= 1; @y += 1
    when 'n'
      @y += 2
    when 'ne'
      @x += 1; @y += 1
    when 'sw'
      @x -= 1; @y -= 1
    when 's'
      @y -= 2
    when 'se'
      @x += 1; @y -= 1
    end

    @furthest = [furthest, distance].max
  end
end

position = Position.new
position.follow!(input)

puts position.furthest
