def display_board(board)
  divider = "-----------"
  puts " #{board[0]} | #{board[1]} | #{board[2]} "
  puts divider
  puts " #{board[3]} | #{board[4]} | #{board[5]} "
  puts divider
  puts " #{board[6]} | #{board[7]} | #{board[8]} "
end


def input_to_index(x)
  x.to_i - 1
end


def move(board, position, player = "X")
  def update_array_at_with(array, index, value)
    array[index] = value
  end
  update_array_at_with(board, position, player)
  display_board(board)
end


def valid_move?(board, index)
 if (!position_taken?(board, index) && index.between?(0,8))
   return true
 else
   return false
 end
end


def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

def move(board, position, player = "X")
  def update_array_at_with(array, index, value)
    array[index] = value
  end
  update_array_at_with(board, position, player)
  display_board(board)
end


def turn(board)
  puts "Please enter 1-9:"
  choice = gets.strip
  position = input_to_index(choice)
  if (!position_taken?(board, position) && valid_move?(board, position))
    move(board, position, player = "X")
    #display_board(board)
  else
    turn(board)
  end
end


# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [
  [0,1,2],
  [3,4,5],
  [6,7,8],
  [0,3,6],
  [1,4,7],
  [2,5,8],
  [0,4,8],
  [6,4,2],
]

def won?(board)
  WIN_COMBINATIONS.any? do |win_combination|
    win_index_1 = win_combination[0]
    win_index_2 = win_combination[1]
    win_index_3 = win_combination[2]

    position_1 = board[win_index_1]
    position_2 = board[win_index_2]
    position_3 = board[win_index_3]

    if position_1 == "X" && position_2 == "X" && position_3 == "X" || position_1 == "O" && position_2 == "O" && position_3 == "O"
      return win_combination
    else
      false
    end
  end
end

def full?(board)
  board.all? do |index|
    index.include?("X") || index.include?("O")
  end
end

def draw?(board)
  if !won?(board) && full?(board)
    return true
  end
end

def over?(board)
  if won?(board) || full?(board) || draw?(board)
    return true
  end
end

def winner(board)
 if won?(board)
   win_index_1 = won?(board)[0]
   win_index_2 = won?(board)[1]
   win_index_3 = won?(board)[2]

   position_1 = board[win_index_1]
   position_2 = board[win_index_2]
   position_3 = board[win_index_3]
   return position_1
 end
end
