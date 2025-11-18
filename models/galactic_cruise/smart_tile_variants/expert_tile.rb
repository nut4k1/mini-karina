module GalacticCruise
  module SmartTileVariants
    module ExpertTile
      KEY = :expert_tile

      def fixture_path = "#{super}expert_tiles/"
      def geometry_by_position = { 1 => '+278+306' }
    end
  end
end
