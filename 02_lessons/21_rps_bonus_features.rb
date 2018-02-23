WEAPON = { r: "rock", p: "paper", s: "scissors", l: "lizard", k: "spock" }

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

loop do
  player_score = 0
  computer_score = 0

  loop do
    choice = ""

    loop do
      prompt("Enter a single letter to make your choice: ")
      WEAPON.each { |k, v| puts "     #{k}  (for #{v})" }
      choice = Kernel.gets().chomp().downcase.to_sym
      WEAPON.key?(choice) ? break : prompt("That's not a valid choice.")
    end

    computers_weapon = WEAPON.values.sample
    players_weapon = WEAPON[choice]

    clear
    prompt("You chose: #{players_weapon}. Computer chose: #{computers_weapon}")
    display_results(players_weapon, computers_weapon)

    if win?(players_weapon, computers_weapon)
      player_score += 1
    elsif win?(computers_weapon, players_weapon)
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
