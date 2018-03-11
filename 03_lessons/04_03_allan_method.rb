def factors(number)
  return nil if number <= 0
  dividend = number
  divisors = []
  begin
    divisors << number / dividend if number % dividend == 0
    dividend -= 1
  end until dividend == 0
  divisors
end

p factors(0)
p factors(-1)


# bonus 1
# To get the factors (if remainder, then not a factor)

# bonus 2
# To make sure divisors is returned
