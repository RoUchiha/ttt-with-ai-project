class Board

    attr_accessor :cells

    def initialize
        @cells = reset!
    end

    def reset!
        @cells = Array.new(9, " ")
    end

    def display
        puts " #{@cells[0]} | #{@cells[1]} | #{@cells[2]} "
        puts "-----------"
        puts " #{@cells[3]} | #{@cells[4]} | #{@cells[5]} "
        puts "-----------"
        puts " #{@cells[6]} | #{@cells[7]} | #{@cells[8]} "
    end

    def position(input)
        user_move = input.to_i 
        array_move = user_move - 1
        return @cells[array_move]
    end

    def full?
        if @cells.count { |c| c == " " } == 0
            return true
        else
            return false
        end
    end

    def turn_count
        empty_spaces = @cells.count{ |c| c == " "}

        return 9 - empty_spaces
    end

    def taken?(input)
        if @cells[input.to_i - 1] == "X" || @cells[input.to_i - 1] == "O"
            return true
        else
            return false
        end
    end

    def valid_move?(position)
        if position.to_i > 9 || position.to_i < 1
            return false
        elsif 
            taken?(position) == true
            return false
        else
            return true
        end
    end

    def update(position, player)
        @cells[position.to_i - 1] = player.token
    end

end