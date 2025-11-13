module GalacticCruise
  module SmartTileVariants
    module ActionTile
      ACTION_IMAGE_PATH = "./fixtures/galactic_cruise/action_tiles/"
      ACTION_IMAGE_POSTFIX = ".png"
      KEY = :action_tile

      def geometry_by_position
        {
          1 => "+39+18",
          2 => "+39+124",
          3 => "+39+438",
          4 => "+39+544",
          5 => "+433+18",
          6 => "+433+124",
          7 => "+433+438",
          8 => "+433+544",
          9 => "+827+18",
          10 => "+827+124",
          11 => "+827+438",
          12 => "+827+544"
        }
      end

      def image_path
        [
          ACTION_IMAGE_PATH,
          orientation,
          name,
          ACTION_IMAGE_POSTFIX
        ].join("")
      end

      def orientation = @position.odd? ? "top/" : "bottom/"
    end
  end
end