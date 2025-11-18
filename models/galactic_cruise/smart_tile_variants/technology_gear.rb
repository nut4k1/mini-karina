module GalacticCruise
  module SmartTileVariants
    module TechnologyGear
      KEY = :gear_meeple

      def fixture_path = "#{super}gear_meeples/"

      def geometry_by_position
        {
          1 => '+8+125',
          2 => '+283+125',
          3 => '+558+125',
          4 => '+833+125'
        }
      end
    end
  end
end
