module GalacticCruise
  module SmartTileVariants
    module CruiseMock
      ACTION_IMAGE_PATH = "./fixtures/galactic_cruise/cruise_mocks/"
      ACTION_IMAGE_POSTFIX = ".png"
      KEY = :action_tile

      def geometry_by_position
        {
          6 => "+21+83",
          5 => "+21+388"
        }
      end

      def image_path
        [
          ACTION_IMAGE_PATH,
          "cruise_mock",
          ACTION_IMAGE_POSTFIX
        ].join("")
      end
    end
  end
end