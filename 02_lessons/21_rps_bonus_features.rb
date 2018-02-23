def win?(first, second)
  (first == "rock" && second == "scissors") ||
    (first == "rock" &&  second == "lizard") ||
    (first == "paper" && second == "rock") ||
    (first == "paper" && second == "sprock") ||
    (first == "scissors" && second == "paper") ||
    (first == "scissors" && second == "lizard") ||
    (first == "lizard" && second == "sprock") ||
    (first == "lizard" && second == "paper") ||
    (first == "sprock" && second == "scissors") ||
    (first == "sprock" && second == "rock")
end

def display_results(player, computer)
  if win?(player, computer)
    prompt("You won!")
  elsif win?(computer, player)
    prompt("Computer won!")
  else
    prompt("This game is a tie")
  end
end

def display_score(player, computer)
  if player == 5
    prompt "You are the GRAND CHAMPION!!!"
  elsif computer == 5
    prompt "The computer is the GRAND CHAMPION!!!"
  else
    prompt "Score: You = #{player}, Computer = #{computer}"
    prompt "First to five wins!"
  end
end

def prompt(message)
  Kernel.puts("=> #{message}")
end

thing = { r: "rock", p: "paper", s: "scissors", l: "lizard", k: "sprock" }
20
loop do
  player_score = 0
  computer_score = 0

  loop do
    choice = ""

    loop do
      prompt("Enter a single letter to make your choice: ")
      thing.each { |k, v| puts "     #{k}  (for #{v})" }
      choice = Kernel.gets().chomp().to_sym

      if thing.key?(choice)
        break
      else
        prompt("That's not a valid choice.")
      end
    end

    computer_choice = thing.values.sample

    prompt("You chose: #{thing[choice]}. Computer chose: #{computer_choice}")
    display_results(thing[choice], computer_choice)

    if win?(thing[choice], computer_choice)
      player_score += 1
    elsif win?(computer_choice, thing[choice])
      computer_score += 1
    end

    display_score(player_score, computer_score)
    player_score == 5 || computer_score == 5 ? break : prompt("Go Again!!!")
    puts("")
  end

  another_game = nil
  loop do
    prompt("Do you want to play again? 'Y' or 'N'")
    another_game = Kernel.gets().chomp().upcase
    if ["N", "Y"].include?(another_game)
      break
    else
      prompt("Just a simple 'Y' or 'N' thanks!")
    end
  end

  break unless another_game == "Y"
  system("clear") || system("cls")
end

system("clear") || system("cls")
prompt("Thank you for playing. Good Bye!")
