require_relative "tree_node.rb"

class KnightPathFinder

    def initialize(pos)
        @grid = Array.new(8){Array.new(8)}
        @root = PolyTreeNode.new(pos)
    end
    def [](pos)
        row,col = pos
        @grid[row][col]
    end
    def []=(pos,val)
        row, col = pos
        @grid[row][col] = val
    end
    def self.valid_moves(pos)
         right_moves = knight_moves(pos).select do |posible_pos|
            (posible_pos[0] >= 0 && posible_pos[0] < 9) && (posible_pos[1] >= 0 && posible_pos[1] < 9) && !considered_positions.include?(posible_pos[0],posible_pos[1])
        end
        right_moves
    end
    def knight_moves(pos)
        row, col = pos
        [[row +1, col +2], [row +1, col -2], [row - 1, col +2], [row - 1, col -2], [row +2, col +1], [row +2, col - 1], [row - 2, col +1], [row -2, col - 1]]
    end

    def considered_positions
        considered_positions = []
    end
    

end

