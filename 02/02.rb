require_relative './game.rb'

games = File.read("input.txt").lines.map { |l| Game.new(l) }

# part 1

limits = {
  "red" => 12,
  "green" => 13,
  "blue" => 14,
}

puts games.select { |g| g.possible?(limits) }.map(&:id).sum

# part 2
#
puts games.map { |g| g.minimum_cubes_required.values.inject(:*) }.sum
