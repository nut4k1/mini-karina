module GalacticCruise
  module SmartTileVariants
    module CruiseMock
      KEY = :cruise_mock

      def fixture_path = "#{super}cruise_mocks/"

      def geometry_by_position
        {
          6 => '+21+83',
          5 => '+21+388'
        }
      end
    end
  end
end
