require "pry"

INITIAL_MARKER = " "
PLAYER_MARKER = "X"
COMPUTER_MARKER = "O"
WINNING_LINES = [[1, 2, 3], [4, 5, 6], [7, 8, 9]] +
                [[1, 4, 7], [2, 5, 8], [3, 6, 9]] +
                [[1, 5, 9], [3, 5, 7]]

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


def defence(brd)
  threats = WINNING_LINES.select do |line|
    brd.values_at(*line).count(PLAYER_MARKER) == 2 &&
      brd.values_at(*line).count(INITIAL_MARKER) == 1
  end
  array = threats.flatten.select {|item| brd[item] == INITIAL_MARKER }
  array.sample
end

def computer_places_piece!(brd)
  move = defence(brd)
  if move.nil?
    square = empty_squares(brd).sample
    brd[square] = COMPUTER_MARKER
  else
    brd[move] = COMPUTER_MARKER
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
  else nil
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
  players.any? do |_, score|
    score >= 5
  end
end

loop do # match loop
  competitors = { player: 0, computer: 0, ties: 0 }

  loop do # game loop
    board = initialize_board

    loop do # move loop
      display_board(board, competitors)

      player_places_piece!(board)
      break if someone_won?(board) || board_full?(board)

      computer_places_piece!(board)
      break if someone_won?(board) || board_full?(board)
    end

    update_match_score(board, competitors)
    display_board(board, competitors)

    if someone_won?(board)
      prompt "#{detect_winner(board)} won!"
      sleep(3)
    else
      prompt "It's a tie"
      sleep(3)
    end

    if match_winner?(competitors)
      break
    end
  end

  answer = nil
  loop do
    prompt "Play again? (y or n)"
    answer = gets.chomp.downcase
    break if ["y", "n"].include?(answer)
    puts "Just a simple 'y' or 'n' thanks!"
  end

  break unless answer.include?("y")
end

puts "Thanks for playing Tic Tac Toe. Good Bye!"
