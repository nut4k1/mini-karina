module GalacticCruise
  module SmartTileVariants
    module GuestMeeple
      ACTION_IMAGE_PATH = "./fixtures/galactic_cruise/guest_meeples/"
      ACTION_IMAGE_POSTFIX = ".png"
      KEY = :guest_bonus

      def geometry_by_position
        {
          1 => "+779+1747",
          2 => "+779+1176",
          3 => "+779+604",
          4 => "+779+1658",
          5 => "+779+1087",
          6 => "+779+515",
          7 => "+779+1569",
          8 => "+779+998",
          9 => "+779+426",
          10 => "+779+1480",
          11 => "+779+909",
          12 => "+779+337",
          13 => "+779+1391"
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