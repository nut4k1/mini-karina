module GalacticCruise
  module SmartTileVariants
    module ActionGear
      KEY = :action_gear

      def fixture_path = "#{super}meeples/"

      def geometry_by_position
        {
          1 => '+82+283',
          2 => '+278+75',
          3 => '+673+75',
          4 => '+870+283',
          5 => '+673+499',
          6 => '+278+499'
        }
      end
    end
  end
end
