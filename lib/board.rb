class Board

    attr_accessor :cells

    def reset! #done
        @cells = Array.new(9, " ")
    end
    
    def initialize #done
        reset!
    end

    def display #done
    puts " #{self.cells[0]} | #{self.cells[1]} | #{self.cells[2]} "
    puts "-----------"
    puts " #{self.cells[3]} | #{self.cells[4]} | #{self.cells[5]} "
    puts "-----------"
    puts " #{self.cells[6]} | #{self.cells[7]} | #{self.cells[8]} "
    end

    def position(input) #done
        self.cells[input.to_i-1]
    end

    def update(position, player)
        self.cells[position.to_i-1] = player.token
    end

    def full? #done
        cells.all? do |cell|
            cell == "X" || cell == "O"
        end
    end

    def turn_count #done
        cells.count {|square| square != " " }
    end

    def taken?(input) #done
        position(input) == "X" || position(input) == "O"
    end

    def valid_move?(input) #done
        !taken?(input) && input.to_i.between?(1,9)
    end
end

