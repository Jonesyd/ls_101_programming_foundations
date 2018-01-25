# Methods
def prompt(message)
  puts(">> #{message}")
end

def valid_float?(string)
  string.to_f.to_s == string || string.to_f.to_s + "0"   == string
end

def valid_int?(string)
  string.to_i.to_s == string || string.to_i.to_s + ".00" == string
end

def valid_number?(string)
  valid_float?(string) || valid_int?(string)
end

def positive?(string)
  string.to_i > 0 || string.to_f > 0
end

def zero_or_positive?(string)
  string.to_i >= 0 || string.to_f >= 0
end

def monthly_rate(annual_rate)
  annual_rate.to_f / 12 / 100
end

def loan_months(years_of_loan, remainder_months)
  years_of_loan.to_i * 12 + remainder_months.to_i
end

def monthly_payments(loan_amount, mth_rate, mth_duration)
  return loan_amount.to_f / mth_duration if mth_rate == 0
  loan_amount.to_f * (mth_rate / (1 - (1 + mth_rate)**-mth_duration))
end

# Error Messages
number_error  = "Please enter digits only (to two decimal places at most)."
integer_error = "Please enter whole numbers (no decimal points)"
zero_error    = "Must be greater than zero."
less_error    = "Must be zero or more"
term_error    = <<-MSG
The sum of years AND months cannot be zero.
  Please re-enter:
MSG
again_error = "Just a simple 'Y' or 'N' thanks!"

# Messages
LINES = "======================================================="
welcome = "      Welcome to the Monthly Payment Calculator!"
prompt(LINES)
prompt(welcome)

loop do
  prompt(LINES)
  # Obtaining Inputs
  loan_amount = nil
  loop do
    prompt("How much (in $) is the loan?")
    loan_amount = Kernel.gets().chomp()
    prompt(number_error) unless valid_number?(loan_amount)
    prompt(zero_error)   unless positive?(loan_amount)
    break if valid_number?(loan_amount) && positive?(loan_amount)
  end

  question_annual_percent = <<-MSG
  What is the annual percentage rate of the loan?
      (e.g. enter 5 for 5%, or 4.5 for 4.5%)
  MSG
  annual_rate = nil
  loop do
    prompt(question_annual_percent)
    annual_rate = Kernel.gets().chomp()
    prompt(number_error)  unless valid_number?(annual_rate)
    prompt(less_error)    unless zero_or_positive?(annual_rate)
    break if valid_number?(annual_rate) && zero_or_positive?(annual_rate)
  end

  question_duration = <<-MSG
  How long is the loan in years and months?
    E.g. 5 and half years would be 5 years and 6 months.
    Enter full years first. How many full years is the loan?
  MSG
  years_of_loan = nil
  remainder_months = nil
  mth_duration = nil

  loop do # non-zero-term loop
    loop do
      prompt(question_duration)
      years_of_loan = Kernel.gets().chomp()
      prompt(integer_error) unless valid_int?(years_of_loan)
      prompt(less_error)    unless zero_or_positive?(years_of_loan)
      break if valid_int?(years_of_loan) && zero_or_positive?(years_of_loan)
    end

    loop do
      prompt("And how many months (must be less than 12)?")
      remainder_months = Kernel.gets().chomp()
      next if remainder_months.to_i >= 12
      prompt(less_error)    unless zero_or_positive?(remainder_months)
      prompt(integer_error) unless valid_int?(remainder_months)
      break if valid_int?(remainder_months) && zero_or_positive?(remainder_months)
    end

    mth_duration = loan_months(years_of_loan, remainder_months)
    mth_duration == 0 ? prompt(term_error) : break
  end # close non-zero term loop

  # Calculations
  mth_rate        = monthly_rate(annual_rate)
  payments        = monthly_payments(loan_amount, mth_rate, mth_duration)
  total_payments  = payments * mth_duration
  total_interest  = total_payments - loan_amount.to_i

  # Output
  prompt("*** LOAN SUMMARY ***")
  prompt("The monthly payment is $#{format('%02.2f', payments)}")
  prompt("Loan duration is #{mth_duration.round(0)} months")
  prompt("The annual interest rate is #{annual_rate}%")
  prompt("The initial loan is for $#{format('%02.2f', loan_amount)}")
  prompt("Total Repayments are $#{format('%02.2f', total_payments)}")
  prompt("Interest over the loan is $#{format('%02.2f', total_interest)}")
  prompt(LINES)

  response = nil
  loop do
    prompt("Would you like to make another calculation 'Y' or 'N'")
    response = Kernel.gets().chomp().upcase
    ["N", "Y"].include?(response) ? break : prompt(again_error)
  end

  if response == "N"
    prompt("Okay. Bye!")
    prompt(LINES)
    break
  end

  puts "\e[H\e[2J"

end
