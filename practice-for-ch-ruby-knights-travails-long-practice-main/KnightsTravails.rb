require_relative "tree_node.rb"

class KnightPathFinder
    attr_reader :considered_positions, :root, :start_pos

    def initialize(pos)
        @grid = Array.new(8){Array.new(8)}
        @root = PolyTreeNode.new(pos)
        @considered_positions = [pos]
        @start_pos = pos
    end
    def [](pos)
        row,col = pos
        @grid[row][col]
    end
    def []=(pos,val)
        row, col = pos
        @grid[row][col] = val
    end

    def build_move_tree
        q = Queue.new 
        q.enq(@root)

        until q.empty?
            curr = q.deq
            new_pos = new_move_positions(curr.value)        
            new_pos.each do |ele|             
                child = PolyTreeNode.new(ele)
                q.enq(child)
                curr.add_child(child)
            end
        end
    end
    def find_path(end_pos)
        target_node = @root.dfs(end_pos)
        trace_path_back(target_node)
       
    end

    def trace_path_back(target)
       curr_node = target
       moves = [] 
       until curr_node.value == @root.value
        moves.unshift(curr_node.value)
        curr_node = curr_node.parent
       end 
       moves.unshift(@root.value)
    end


    # def bfs(target)
    #     q = []
    #     q << self
    #     until q.empty?
    #       curr = q.shift
    #       return curr if curr.value == target
    #       curr.children.each {|child| q << child}
    #     end
    #     nil
    #   end


    def self.valid_moves(pos)
        (pos[0] >= 0 && pos[0] < 9) && (pos[1] >= 0 && pos[1] < 9)
    end
    def knight_moves(pos)
        row, col = pos
       return [[row +1, col +2], [row +1, col -2], [row - 1, col +2], [row - 1, col -2], [row +2, col +1], [row +2, col - 1], [row - 2, col +1], [row -2, col - 1]] 
    end

    def new_move_positions(pos)
        poss_moves = []
        knight_moves(pos).each do |move| 
            if KnightPathFinder.valid_moves(move) && !@considered_positions.include?(move)
                @considered_positions << move
                poss_moves << move
            end
        end
        poss_moves
    end

   
    

end

