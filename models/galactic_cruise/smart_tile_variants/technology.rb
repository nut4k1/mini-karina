module GalacticCruise
  module SmartTileVariants
    module Technology
      KEY = :technology

      def fixture_path = "#{super}technologies/"

      def geometry_by_position
        {
          1 => '+7+8',
          2 => '+281+8',
          3 => '+556+8',
          4 => '+831+8'
        }
      end
    end
  end
end
