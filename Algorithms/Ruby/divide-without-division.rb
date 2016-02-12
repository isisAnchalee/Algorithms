def divide(numerator, denominator)
  return 0 if numerator == 0 || numerator < denominator
  return 1 if numerator == denominator 

  raise 'cannot divide by zero!' if denominator == 0

  power_of_two = 0
  current = denominator

  while current < numerator
    break if current * 2 > numerator
    current *= 2
    power_of_two += 1
  end


  remainder = numerator - current
  return 2**power_of_two + divide(remainder, denominator)
end
