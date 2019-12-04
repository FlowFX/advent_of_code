# frozen_string_literal: true

require 'minitest/autorun'

# Tests
class TestDay01 < MiniTest::Test
  def test_fuel_per_module
    assert_equal 2, fuel_per_mass(12)
    assert_equal 2, fuel_per_mass(14)
    assert_equal 654, fuel_per_mass(1969)
    assert_equal 33_583, fuel_per_mass(100_756)
    assert_equal 0, fuel_per_mass(2)
  end

  def test_fuel_per_module_including_mass_of_fuel
    assert_equal 966, fuel_per_mass_including_mass_of_fule(1969)
    assert_equal 50_346, fuel_per_mass_including_mass_of_fule(100_756)
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
  [mass.to_i / 3 - 2, 0].max
end

def fuel_per_mass_including_mass_of_fule(mass)
  total = 0
  fuel = mass

  loop do
    fuel = fuel_per_mass(fuel)
    total += fuel
    break if fuel.zero?
  end

  total
end

def fuel_required(input)
  input.sum { |x| fuel_per_mass(x) }
end

def fuel_required_including_mass_of_fuel(input)
  input.sum { |x| fuel_per_mass_including_mass_of_fule(x) }
end

puts 'Total fuel required: ', fuel_required(day01_input)
puts 'Total fuel required, including fuel for the fuel: ', fuel_required_including_mass_of_fuel(day01_input)
