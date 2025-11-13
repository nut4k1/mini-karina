module GalacticCruise
  module SmartTileVariants
    module LocationBonus
      ACTION_IMAGE_PATH = "./fixtures/galactic_cruise/location_bonuses/"
      ACTION_IMAGE_POSTFIX = ".png"
      KEY = :location_bonus

      def geometry_by_position
        {
          1 => "+16+79",
          2 => "+411+79",
          3 => "+805+79",
          4 => "+16+499",
          5 => "+411+499",
          6 => "+805+499"
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