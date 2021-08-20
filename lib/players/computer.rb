module Players
    class Computer < Player

        def move(board)
            m = rand(1..9)
            if board.taken?(m) == false
                m.to_s
            else
                move(board)
            end
        end
    end
end