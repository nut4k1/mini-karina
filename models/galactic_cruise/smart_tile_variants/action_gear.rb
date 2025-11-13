module GalacticCruise
  module SmartTileVariants
    module ActionGear
      ACTION_IMAGE_PATH = "./fixtures/galactic_cruise/meeples/"
      ACTION_IMAGE_POSTFIX = ".png"
      KEY = :action_tile

      def geometry_by_position
        {
          1 => "+82+283",
          2 => "+278+75",
          3 => "+673+75",
          4 => "+870+283",
          5 => "+673+499",
          6 => "+278+499",
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