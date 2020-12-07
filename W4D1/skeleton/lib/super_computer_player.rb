require_relative 'tic_tac_toe_node'

class SuperComputerPlayer < ComputerPlayer
  def move(game, mark)
    new_node = TicTacToeNode.new(game.board, mark)
    children = new_node.children
    children.each {|child| return child.prev_move_pos if child.winning_node?(mark)}
    children.each {|child| return child.prev_move_pos unless child.losing_node?(mark)}
    raise 'Invalid game state'
  end
end

if __FILE__ == $PROGRAM_NAME
  puts "Play the brilliant computer!"
  hp = HumanPlayer.new("Jeff")
  cp = SuperComputerPlayer.new

  TicTacToe.new(hp, cp).run
end
