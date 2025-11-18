module GalacticCruise
  module SmartTileVariants
    module GuestBonus
      KEY = :guest_bonus

      def fixture_path = "#{super}guest_bonuses/"

      def geometry_by_position
        {
          1 => '+107+75',
          2 => '+573+75',
          3 => '+1039+75'
        }
      end
    end
  end
end
