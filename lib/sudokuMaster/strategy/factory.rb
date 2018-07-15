module Sudokumaster
  module Strategy
    class Factory
      def self.build(difficulty)
        # at this point we only have simple player
        case difficulty
        when :simple
          Sudokumaster::Strategy::SimplePlayer.new
        end
      end
    end
  end
end
