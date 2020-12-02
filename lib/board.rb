
class Board

    attr_accessor :cells, :last_move

    def initialize
        self.reset!
    end

    def reset!
        self.cells = Array.new(9, " ")
    end

    def display
        puts " #{@cells[0]} | #{@cells[1]} | #{@cells[2]} "
        puts "-----------"
        puts " #{@cells[3]} | #{@cells[4]} | #{@cells[5]} "
        puts "-----------"
        puts " #{@cells[6]} | #{@cells[7]} | #{@cells[8]} "
    end

    def position(user_input)
        # input to index
        index = user_input.to_i - 1
        self.cells[index]
    end

    def update(user_input, player)
        # input to index
        index = user_input.to_i - 1
        self.last_move = index
        # token method
        self.cells[index] = player.token
    end

    def full?
        self.cells.all? {|pos| pos == "X" || pos == "O"}
    end

    def turn_count
        turns = self.cells.select {|pos| pos != " "}
        turns.length
    end

    def taken?(user_input)
        # input to index
        index = user_input.to_i - 1
        self.cells[index] != " " ? true : false
    end

    def valid_move?(user_input)
        # may need to use index instead
        pos = user_input.to_i
        if pos.between?(1, 9) && !self.taken?(user_input)
            true
        else
            false
        end
    end
end

