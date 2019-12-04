# frozen_string_literal: true

require 'minitest/autorun'

# Tests
class TestDay01 < MiniTest::Test
  def test_fuel_per_module
    assert_equal 2, fuel_per_mass(12)
    assert_equal 2, fuel_per_mass(14)
    assert_equal 654, fuel_per_mass(1969)
    assert_equal 33_583, fuel_per_mass(100_756)
  end

  def test_total_fuel
    input = [12, 14, 1969, 100_756]

    assert_equal (2 + 2 + 654 + 33_583), fuel_required(input)
  end
end

def day01_input
  File.read('input.txt').lines
end

def fuel_per_mass(mass)
  (mass.to_i / 3).floor - 2
end

def fuel_required(input)
  input.sum { |x| fuel_per_mass(x) }
end

puts 'Total fuel required: ', fuel_required(day01_input)
