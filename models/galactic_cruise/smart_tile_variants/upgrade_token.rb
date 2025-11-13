module GalacticCruise
  module SmartTileVariants
    module UpgradeToken
      ACTION_IMAGE_PATH = "./fixtures/galactic_cruise/upgrade_tokens/"
      ACTION_IMAGE_POSTFIX = ".png"
      KEY = :upgrade_token

      def geometry_by_position
        {
          1 => "+24+729",
          2 => "+24+872",
          3 => "+169+729",
          4 => "+169+872"
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