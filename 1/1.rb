masses = [
  # input
]

fuels = masses.map do |mass|
  (mass / 3).floor - 2
end

# question 1
sum_of_fuels = fuels.sum


# question 2
def fuel_of_fuel(fuel)
  next_fuel_of_fuel = (fuel / 3).floor - 2
  if (next_fuel_of_fuel > 0)
    next_fuel_of_fuel += fuel_of_fuel(next_fuel_of_fuel)
  end
  ret = next_fuel_of_fuel < 0 ? 0 : next_fuel_of_fuel
  puts ret
  ret
end

sum_of_fuel_with_fuel = masses.map { |f| fuel_of_fuel(f) }.sum
