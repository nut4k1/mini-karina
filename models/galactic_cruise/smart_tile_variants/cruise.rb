module GalacticCruise
  module SmartTileVariants
    module Cruise
      ACTION_IMAGE_PATH = "./fixtures/galactic_cruise/cruises/"
      ACTION_IMAGE_POSTFIX = ".png"
      KEY = :cruise

      def geometry_by_position
        {
          6 => "+33+140",
          5 => "+33+445",
          4 => "+33+750",
          3 => "+33+1055",
          2 => "+33+1360",
          1 => "+33+1665"
        }
      end

      def image_path
        [
          ACTION_IMAGE_PATH,
          name,
          ACTION_IMAGE_POSTFIX
        ].join("")
      end

      def meeples
        {
          B1: [:orange],
          B2: [:purple],
          B3: [:purple, :orange],
          B4: [:purple, :mint, :orange],
          B5: [:purple, :mint, :orange],
          B6: [:mint, :purple],
          B7: [:orange],
          B8: [:mint, :orange],
          B9: [:purple, :mint, :orange],
          B10: [:mint],
          B11: [:purple],
          B12: [:orange, :mint],
          B13: [:orange, :purple],
          B14: [:mint],
          B15: [:mint, :orange]
        }[@name.to_sym]
      end
    end
  end
end