require "set"
require_relative "player"


class Game
    ALPHABET = Set.new("a".."z")
    MAX_LOSSES = 5

    def initialize(*players)
        words = File.readlines("dictionary.txt").map(&:chomp)
        @dictionary = Set.new(words)
        @players = players.map!{|player| Player.new(player)}
        @losses = Hash.new(0)
        @players.each {|player| @losses[player]}
    end

    def play_round
        @fragment = ""
        until self.round_over?
            self.take_turn
            self.next_player!
        end

        self.update_standings
    end

    def next_player!
        @players.rotate!
        @current_player = @players.first
        @previous_player = @players[-1]
    end

    def is_word?(fragment)
        dictionary.include?(fragment)
    end

    def round_over?
        is_word?(fragment)
    end

    def take_turn
        letter = nil
        until letter
            letter = @current_player.guess(@fragment)

            unless valid_play?(letter)
                @current_player.alert_invalid_guess(letter)
                letter = nil
            end
        end

        add_letter(letter)
    end

    def valid_play?(letter)
        return false unless ALPHABET.include?(letter)
    end
    attr_reader :fragment, :dictionary, :losses, :players

  
end