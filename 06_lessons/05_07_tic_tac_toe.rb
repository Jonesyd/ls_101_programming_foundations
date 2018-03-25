# nice to have match score
# added functionality based on last win as a bonus.

require "pry"
require "pry-byebug"

INITIAL_MARKER = " "
PLAYER_MARKER = "X"
COMPUTER_MARKER = "O"
WINNING_LINES = [[1, 2, 3], [4, 5, 6], [7, 8, 9]] +
                [[1, 4, 7], [2, 5, 8], [3, 6, 9]] +
                [[1, 5, 9], [3, 5, 7]]

FIRST_TURN = {
  player: false,
  computer: false,
  alternate_p1: false,
  alternate_c1: false
}

def prompt(msg)
  puts "=> #{msg}"
end

# rubocop:disable Metrics/MethodLength, Metrics/AbcSize
def display_board(brd, score_hash={ player: 0, computer: 0, ties: 0 })
  system("clear") || system("cls")
  puts "You're a #{PLAYER_MARKER}. Computer is #{COMPUTER_MARKER}"
  puts "First to 5, wins the match"
  puts "Match score is: You #{score_hash[:player]}, " \
       "Computer #{score_hash[:computer]}, " \
       "Ties #{score_hash[:ties]}"
  puts ""
  puts "     |     |"
  puts "  #{brd[1]}  |  #{brd[2]}  |  #{brd[3]}"
  puts "     |     |"
  puts "-----+-----+-----"
  puts "     |     |"
  puts "  #{brd[4]}  |  #{brd[5]}  |  #{brd[6]}"
  puts "     |     |"
  puts "-----+-----+-----"
  puts "     |     |"
  puts "  #{brd[7]}  |  #{brd[8]}  |  #{brd[9]}"
  puts "     |     |"
  puts ""
end
# rubocop:enable Metrics/MethodLength, Metrics/AbcSize

def initialize_board
  new_board = {}
  (1..9).each { |num| new_board[num] = INITIAL_MARKER }
  new_board
end

def empty_squares(brd)
  brd.keys.select { |num| brd[num] == INITIAL_MARKER }
end

def player_places_piece!(brd)
  square = ""
  loop do
    prompt "Choose a square (#{joinor(empty_squares(brd))}):"
    square = gets.chomp.to_i
    break if empty_squares(brd).include?(square)
    prompt "Sorry, that's not a valid choice, try again"
  end
  brd[square] = PLAYER_MARKER
end

def strategic_move(brd, competitor)
  threats = WINNING_LINES.select do |line|
    brd.values_at(*line).count(competitor) == 2 &&
      brd.values_at(*line).count(INITIAL_MARKER) == 1
  end
  array = threats.flatten.select { |item| brd[item] == INITIAL_MARKER }
  array.sample
end

def computer_places_piece!(brd)
  offend_move = strategic_move(brd, COMPUTER_MARKER)
  defend_move = strategic_move(brd, PLAYER_MARKER)
  if !offend_move.nil?
    brd[offend_move] = COMPUTER_MARKER
  elsif !defend_move.nil?
    brd[defend_move] = COMPUTER_MARKER
  elsif brd[5] == INITIAL_MARKER
    brd[5] = COMPUTER_MARKER
  else
    square = empty_squares(brd).sample
    brd[square] = COMPUTER_MARKER
  end
end

def board_full?(brd)
  empty_squares(brd).empty?
end

def someone_won?(brd)
  !!detect_winner(brd)
end

def detect_winner(brd)
  WINNING_LINES.each do |line|
    if brd.values_at(*line).count(PLAYER_MARKER) == 3
      return "Player"
    elsif brd.values_at(*line).count(COMPUTER_MARKER) == 3
      return "Computer"
    end
  end
  nil
end

def joinor(array, separator=", ", conj="or")
  return nil unless array.is_a?(Array)
  case array.size
  when 0 then ""
  when 1 then array[0].to_s
  when 2 then "#{array[0]} #{conj} #{array[1]}"
  else
    array[-1] = "#{conj} #{array[-1]}"
    array.join(separator)
  end
end

def tie?(brd, score_hash)
  if board_full?(brd) && detect_winner(brd).nil?
    score_hash[:ties] += 1
  end
end

def update_match_score(brd, score_hash)
  score_hash.each do |comp, _|
    if detect_winner(brd) == comp.to_s.capitalize
      score_hash[comp] += 1
    end
  end
  tie?(brd, score_hash)
end

def match_winner?(players)
  players.any? do |player, score|
    [:player, :computer].include?(player) &&
      score >= 5
  end
end

def reset_first_turn!
  FIRST_TURN.each do |comp, _|
    FIRST_TURN[comp] = false
  end
end

# rubocop:disable Metrics/MethodLength
def first_mover_match!
  loop do
    prompt <<-MSG
      Select who goes first:
                 '1' for you every game
                 '2' for computer every game
                 '3' to alternate between games (you first on first game)
                 '4' to alternate between games (computer first on first game)
    MSG
    choice = gets.chomp.to_i
    if [1, 2, 3, 4].include?(choice)
      set_first_turn!(choice)
      break
    else
      prompt "Just select a number (1 to 4) to decide who goes first."
    end
  end
  nil
end
# rubocop:enable Metrics/MethodLength

def set_first_turn!(num)  # each method?

  # test each method here

  FIRST_TURN[:player] = true if num == 1
  FIRST_TURN[:computer] = true if num == 2
  FIRST_TURN[:alternate_p1] = true if num == 3
  FIRST_TURN[:alternate_c1] = true if num == 4
end

def set_current_player
  first = FIRST_TURN.select { |comp, value| value == true }
  if first.keys.count == 1
    case first.key(true)
    when :player then return first.key(true)
    when :computer then return first.key(true)
    when :alternate_p1 then return :player
    when :alternate_c1 then return :computer
    end
  else
    reset_first_turn!
    first_mover_match!
    set_current_player
  end
end

def alternate_player(comp) # should be able to use this.
  return :player if comp == :computer
  return :computer if comp == :player
end

def place_piece!(brd, turn, comp)
  if turn == :player
    player_places_piece!(brd)
  elsif turn == :computer
    computer_places_piece!(brd)
  end
  update_match_score(brd, comp)
  display_board(brd, comp)
end

def display_game_result(brd)
  if someone_won?(brd)
    prompt "#{detect_winner(brd)} won!"
  else
    prompt "It's a tie"
  end
end

def another_match?
  answer = nil
  loop do
    prompt "Play again? (y or n)"
    answer = gets.chomp.downcase
    break if ["y", "n"].include?(answer)
    puts "Just a simple 'y' or 'n' thanks!"
  end
  answer ? true : false
end

def alt_switch(player, comp)
  game_count = comp.values.reduce(:+)
  if game_count.odd? &&
    ( FIRST_TURN[:alternate_p1] == true ||
      FIRST_TURN[:alternate_c1] == true )
    current_player = alternate_player(player)
  else
    current_player = player
  end
  current_player
end


loop do # match loop
  competitors = { player: 0, computer: 0, ties: 0 }
  reset_first_turn!
  first_mover_match!

  loop do # game loop
    board = initialize_board
    display_board(board, competitors)
    current_player = set_current_player
    current_player = alt_switch(current_player, competitors)

    loop do # move loop
      place_piece!(board, current_player, competitors)
      current_player = alternate_player(current_player)
      break if someone_won?(board) || board_full?(board)
    end

    display_game_result(board)
    sleep(1)
    break if match_winner?(competitors)
  end

  break unless another_match?
end

puts "Thanks for playing Tic Tac Toe. You did well! Good Bye!"
