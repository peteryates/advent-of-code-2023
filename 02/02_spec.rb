require 'rspec'
require_relative './game.rb'

RSpec.describe(Game) do
  describe "part 1" do
    let(:input) do
      <<~INPUT
        Game 1: 3 blue, 4 red; 1 red, 2 green, 6 blue; 2 green
        Game 2: 1 blue, 2 green; 3 green, 4 blue, 1 red; 1 green, 1 blue
        Game 3: 8 green, 6 blue, 20 red; 5 blue, 4 red, 13 green; 5 green, 1 red
        Game 4: 1 green, 3 red, 6 blue; 3 green, 6 red; 3 green, 15 blue, 14 red
        Game 5: 6 red, 1 blue, 3 green; 2 blue, 1 red, 2 green
      INPUT
    end

    let(:limits) do
      {
        "red" => 12,
        "green" => 13,
        "blue" => 14,
      }
    end

    let(:games) { input.lines.map { |cubes| Game.new(cubes) }}

    specify "calculates possible game sum correctly" do
      expect(games.select { |g| g.possible?(limits) }.map(&:id).sum).to eql(8)
    end
  end

  describe "part 2" do
    let(:input) do
      <<~INPUT
        Game 1: 3 blue, 4 red; 1 red, 2 green, 6 blue; 2 green
        Game 2: 1 blue, 2 green; 3 green, 4 blue, 1 red; 1 green, 1 blue
        Game 3: 8 green, 6 blue, 20 red; 5 blue, 4 red, 13 green; 5 green, 1 red
        Game 4: 1 green, 3 red, 6 blue; 3 green, 6 red; 3 green, 15 blue, 14 red
        Game 5: 6 red, 1 blue, 3 green; 2 blue, 1 red, 2 green
      INPUT
    end

    let(:games) { input.lines.map { |cubes| Game.new(cubes) }}

    specify "calculates powers correctly" do
      expect(games.map { |g| g.minimum_cubes_required.values.inject(:*) }.sum).to eql(2286)
    end
  end
end
