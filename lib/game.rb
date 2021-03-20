class Game

    attr_accessor :board, :player_1, :player_2

    WIN_COMBINATIONS = [
        [0, 1, 2], [3, 4, 5], [6, 7, 8],
        [0, 3, 6], [1, 4, 7], [2, 5, 8],
        [0, 4, 8], [2, 4, 6]
    ]

    def initialize(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), board = Board.new)
        @board = board
        @player_1 = player_1
        @player_2 = player_2
    end

    def current_player #done
        if board.turn_count.even?
            player_1
        else
            player_2
        end
        
    end

    def won? #done
        WIN_COMBINATIONS.detect do |combo|
            if @board.cells[combo[0]] == "X" && @board.cells[combo[1]] == "X" && @board.cells[combo[2]] == "X"
                combo
            elsif @board.cells[combo[0]] == "O" && @board.cells[combo[1]] == "O" && @board.cells[combo[2]] == "O"
                combo
            else
                false
            end
        end
    end

    def draw? #done
        if @board.full? && !won?
            true
        else
            false
        end
    end

    def over? #done
        if won? || draw?
            true
        else
            false
        end
    end

    def winner #done
        if winning_combo = won?
            @winner = @board.cells[winning_combo.first]
        end

    end

    def turn #done
        player = current_player
        current_move = player.move(@board)
        if !@board.valid_move?(current_move)
            turn
        else
            puts "Turn: #{@board.turn_count+1}\n"
            @board.display
            @board.update(current_move, player)
            puts "#{player.token} moved #{current_move}"
            @board.display
            puts "\n\n"
        end
    end

    def play
        while !over?
            turn
        end
        if won?
            puts "Congratulations #{winner}!"
        elsif draw?
            puts "Cat's Game!"
        end
    end
end

