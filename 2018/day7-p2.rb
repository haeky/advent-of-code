matches = File.readlines('day7.txt').map do |line|
  line.match(/Step (?<start>[A-Z]) must be finished before step (?<end>[A-Z]) can begin./).captures
end

$DONE = ''
$TIMER = 0

def unlocked?(matches, node)
  return false if $DONE.include?(node)

  (matches.select { |_, v| v == node }.map(&:first) - $DONE.chars).empty?
end

class Worker
  attr_accessor :node

  def initialize(matches)
    @matches = matches
  end

  def work!
    return unless @node = (('A'..'Z').to_a.select { |x| unlocked?(@matches, x) } - $WORKERS.map(&:node).compact).first

    @timer = ('A'..'Z').to_a.index(@node) + 60
  end

  def tick!
    @timer -= 1
  end

  def working?
    !@node.nil?
  end

  def cleanup!
    return if @node.nil?

    if @timer&.zero?
      $DONE << @node
      @node = nil
    end
  end
end

$WORKERS = 5.times.map do
  Worker.new(matches)
end

while $DONE.size < 26
  $WORKERS.each do |worker|
    if worker.working?
      worker.tick!
    else
      worker.work!
    end
  end

  $WORKERS.each(&:cleanup!)
  $TIMER += 1
end

puts $TIMER
