RULE = {
  rock: ["scissors", "lizard"],
  paper: ["rock", "spock"],
  scissors: ["paper", "lizard"],
  lizard: ["spock", "paper"],
  spock: ["scissors", "rock"]
}

WIN = 5

def win?(first, second)
  RULE[first.to_sym].include?(second)
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
  if player == WIN
    prompt "You are the GRAND CHAMPION!!!"
  elsif computer == WIN
    prompt "The computer is the GRAND CHAMPION!!!"
  else
    prompt "Score: You = #{player}, Computer = #{computer}"
    prompt "First to five wins!"
  end
end

def prompt(message)
  Kernel.puts("=> #{message}")
end

def clear
  system("clear") || system("cls")
end

weapon = { r: "rock", p: "paper", s: "scissors", l: "lizard", k: "spock" }

loop do
  player_score = 0
  computer_score = 0

  loop do
    choice = ""

    loop do
      prompt("Enter a single letter to make your choice: ")
      weapon.each { |k, v| puts "     #{k}  (for #{v})" }
      choice = Kernel.gets().chomp().downcase.to_sym
      weapon.key?(choice) ? break : prompt("That's not a valid choice.")
    end

    computer_choice = weapon.values.sample

    clear
    prompt("You chose: #{weapon[choice]}. Computer chose: #{computer_choice}")
    display_results(weapon[choice], computer_choice)

    if win?(weapon[choice], computer_choice)
      player_score += 1
    elsif win?(computer_choice, weapon[choice])
      computer_score += 1
    end

    display_score(player_score, computer_score)
    player_score == WIN || computer_score == WIN ? break : prompt("Go Again!!!")
    puts("")
  end

  again = nil
  loop do
    prompt("Do you want to play again? 'Y' or 'N'")
    again = Kernel.gets().chomp().upcase
    ["N", "Y"].include?(again) ? break : prompt("Just 'Y' or 'N' thanks!")
  end

  break unless again == "Y"
  clear
end

clear
prompt("Thank you for playing. Good Bye!")
