module GalacticCruise
  module SmartTileVariants
    module TechnologyGear
      ACTION_IMAGE_PATH = "./fixtures/galactic_cruise/gear_meeples/"
      ACTION_IMAGE_POSTFIX = ".png"
      KEY = :action_tile

      def geometry_by_position
        {
          1 => "+8+125",
          2 => "+283+125",
          3 => "+558+125",
          4 => "+833+125"
        }
      end

      def image_path
        [
          ACTION_IMAGE_PATH,
          "gear",
          ACTION_IMAGE_POSTFIX
        ].join("")
      end
    end
  end
end