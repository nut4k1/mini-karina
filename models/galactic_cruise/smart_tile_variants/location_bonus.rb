module GalacticCruise
  module SmartTileVariants
    module LocationBonus
      KEY = :location_bonus

      def fixture_path = "#{super}location_bonuses/"

      def geometry_by_position
        {
          1 => '+16+79',
          2 => '+411+79',
          3 => '+805+79',
          4 => '+16+499',
          5 => '+411+499',
          6 => '+805+499'
        }
      end
    end
  end
end
