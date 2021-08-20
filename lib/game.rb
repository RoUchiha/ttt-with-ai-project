class Game

    attr_accessor :board, :player_1, :player_2
    
    WIN_COMBINATIONS = [
        [0,1,2],
        [3,4,5],
        [6,7,8],
        [0,3,6],
        [0,4,8],
        [1,4,7],
        [2,5,8],
        [2,4,6]
    ]


    def initialize(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), board = Board.new)
        @board = board
        @player_1 = player_1
        @player_2 = player_2
    end

    def current_player
        if @board.turn_count.to_i.even?
            return player_1
        elsif @board.turn_count.to_i.odd?
            return player_2
        end
    end

    def won?
        WIN_COMBINATIONS.any? do |winner|
            if (@board.cells[winner[0]]) == "X" && (@board.cells[winner[1]]) == "X" && (@board.cells[winner[2]]) == "X"
                return winner
            elsif
                (@board.cells[winner[0]]) == "O" && (@board.cells[winner[1]]) == "O" && (@board.cells[winner[2]]) == "O"
                return winner
            elsif board.turn_count == 0
                return false
            end
        end
    end

    def draw?
        if board.full? == true && won? == false
            return true
        else
            return false
        end
    end

    def over?
        if draw? == true || won? != false
            return true
        else 
            return false
        end
    end

    def winner
        if won? == false
         return nil
        elsif @board.cells[won?[0]] == "O"
         return "O"
        elsif @board.cells[won?[0]] == "X"
         return "X"
        end  
     end

    def turn
        player = current_player
        current_move = player.move(@board)

        if board.valid_move?(current_move) == true
            board.update(current_move, player)
            board.display
        else
            turn
        end
    end

    def play
        board.display
        until over? == true
          turn
        end
 
        if won? != false
         if winner == "X"
             puts "Congratulations X!"
         elsif winner == "O"
             puts "Congratulations O!"
         end
     end
        if draw? == true
            puts "Cat's Game!"
        end
    end




end