module GalacticCruise
  module SmartTileVariants
    module ExpertTile
      ACTION_IMAGE_PATH = "./fixtures/galactic_cruise/expert_tiles/"
      ACTION_IMAGE_POSTFIX = ".png"
      KEY = :action_tile

      def geometry_by_position
        { 1 => "+278+306" }
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