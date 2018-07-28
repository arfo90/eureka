module Sudokumaster
  module Strategy
    class Factory
      def self.build(skill)
        # at this point we only have simple player
        case skill
        when :simple
          Sudokumaster::Strategy::SimplePlayer.new
        end
      end
    end
  end
end
