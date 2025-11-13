module GalacticCruise
  module SmartTileVariants
    module GuestBonus
      ACTION_IMAGE_PATH = "./fixtures/galactic_cruise/guest_bonuses/"
      ACTION_IMAGE_POSTFIX = ".png"
      KEY = :guest_bonus

      def geometry_by_position
        {
          1 => "+107+75",
          2 => "+573+75",
          3 => "+1039+75"
        }
      end

      def image_path
        [
          ACTION_IMAGE_PATH,
          name,
          ACTION_IMAGE_POSTFIX
        ].join("")
      end
    end
  end
end