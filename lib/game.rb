
class Game

    attr_accessor :board, :player_1, :player_2

    WIN_COMBINATIONS = [
        [0, 1, 2],
        [3, 4, 5],
        [6, 7, 8],

        [0, 3, 6],
        [1, 4, 7],
        [2, 5, 8],

        [0, 4, 8],
        [2, 4, 6]
    ]

    def initialize(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), board = Board.new)
        self.player_1 = player_1
        self.player_2 = player_2
        self.board = board
    end

    def current_player
        self.board.turn_count.even? ? player_1 : player_2
    end

    def won?

        def win
            WIN_COMBINATIONS.detect do |combo|
                combo.all? {|i| self.board.cells[i] == "X"} || combo.all? {|i| self.board.cells[i] == "O"}
            end
        end

        win ? win : false
    end

    def draw?
        self.board.full? && !self.won? ? true : false
    end

    def over?
        self.draw? || self.won? ? true : false
    end

    def winner
        self.won? ? self.board.cells[won?[0]] : nil
    end

    def turn

        valid = false

        while !valid
            puts "Choose a space (#{self.current_player.token}): "
            move = self.current_player.move(self.board)
            if self.board.valid_move?(move)
                self.board.update(move, current_player)
                valid = true
            end
        end
    end

    def play

        playing = true

        while playing
            if !self.over?
                self.turn
                self.board.display
            else
                playing = false
            end
        end

        if self.winner
            puts "Congratulations #{self.winner}!"
        else
            puts "Cat's Game!"
        end
    end
end

