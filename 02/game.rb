require 'pry'
require 'pry-byebug'

class Game
  attr_reader :id

  def initialize(input)
    game_id, params = input.split(":")
    
    @id = game_id.delete_prefix("Game ").to_i
    @sets = build_sets(params)
  end

  def possible?(limits)
    @sets.all? { |set| set.all? { |colour, count| count <= limits[colour] }}
  end

  def minimum_cubes_required
    @sets.each_with_object(Hash.new(0)) do |set, h|
      set.each do |colour, count|
        h[colour] = count if h[colour] < count
      end
    end
  end

private

  def build_sets(line)
    line.split(";").map do |set|
      set.scan(/(\d+) (\w+)/).each_with_object({}) do |a, h|
        h[a[1]] = a[0].to_i
      end
    end
  end
end
