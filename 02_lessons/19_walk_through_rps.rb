VALID_CHOICES = %w(rock paper scissors)

def test_method
  prompt("Test Message")
end

def win?(first, second)
  (first == "rock" && second == "scissors") ||
    (first == "paper" && second == "rock") ||
    (first == "scissors" && second == "paper")
end

def display_results(player, computer)
  if win?(player, computer)
    prompt("You won!")
  elsif win?(computer, player)
    prompt("Computer won!")
  else
    prompt("It's a tie")
  end
end

def prompt(message)
  Kernel.puts("=> #{message}")
end

# test_method

loop do
  choice = ""
  loop do
    prompt('Choose one: #{VALID_CHOICES.join(", ")}')
    choice = Kernel.gets().chomp()

    if VALID_CHOICES.include?(choice)
      break
    else
      prompt("That's not a valid choice.")
    end
  end

  computer_choice = VALID_CHOICES.sample

  Kernel.puts("You chose: #{choice}; Computer Chose #{computer_choice}")

  display_results(choice, computer_choice)

  prompt("Do you want to play again?")
  answer = Kernel.gets.chomp
  break unless answer.downcase().start_with?("y")
end

prompt("Thank you for playing. Good Bye!")
