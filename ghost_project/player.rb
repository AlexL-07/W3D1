class Player
    def initialize(name)
        @name = name
    end

    def name 
        @name
    end

    def guess(fragment)
        p "The current fragment is #{fragment}"
        p "Add a letter:"
        gets.chomp.downcase
    end

    def alert_invalid_guess(letter)
        p "#{letter} is not a valid move!"
        p "Your guess must be a letter of the alphabet"
        p "You must be able to form a word starting with the new fragment. \n"
    end

end