
# Functional, but lots of refactoring can be done.

module Players
    class Computer < Player

        def move(board)
            sleep(2)
            if board.cells[4] == " "
                "5"
            else
                if board.cells[board.last_move + 1] == " "
                    (board.last_move + 2).to_s
                elsif board.cells[board.last_move - 3] == " "
                    if (board.last_move - 2).negative? || (board.last_move - 2) == 0
                        (board.last_move + 6).to_s
                    else
                        (board.last_move - 2).to_s
                    end
                elsif board.cells[board.last_move - 1] == " "
                    (board.last_move).to_s
                elsif board.cells[board.last_move + 3] == " "
                    (board.last_move + 4).to_s
                else
                    empty = board.cells.find_index(" ")
                    empty + 1
                end
            end
        end

    end
end

