module Players
    class Human < Player
        def move(board)
            puts "What's your move?"
            m = gets.strip
            return m 
        end

    end
end