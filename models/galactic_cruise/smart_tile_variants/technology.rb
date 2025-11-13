module GalacticCruise
  module SmartTileVariants
    module Technology
      ACTION_IMAGE_PATH = "./fixtures/galactic_cruise/technologies/"
      ACTION_IMAGE_POSTFIX = ".png"
      KEY = :action_tile

      def geometry_by_position
        {
          1 => "+7+8",
          2 => "+281+8",
          3 => "+556+8",
          4 => "+831+8",
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