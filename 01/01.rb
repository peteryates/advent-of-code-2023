require 'pry'

input = File.read("./input.txt").split("\n")

# part 1

puts input
  .map { |l| l.scan(/\d/) }
  .sum { |p| [p.first, p.last].join.to_i }

# part 2

DIGIT_MAPPING = { "one" => "1", "two" => "2", "three" => "3", "four" => "4", "five" => "5",
                  "six" => "6", "seven" => "7", "eight" => "8", "nine" => "9" }

regexp = /(?=(\d|#{DIGIT_MAPPING.keys.join("|")}))/

puts input
  .map { |l| l.scan(regexp).flatten.map { |d| DIGIT_MAPPING.fetch(d, d) } }
  .sum { |p| [p.first, p.last].join.to_i }
