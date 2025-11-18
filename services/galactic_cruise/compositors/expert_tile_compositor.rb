require_relative 'compositor_prototype'

module GalacticCruise
  module Compositors
    class ExpertTileCompositor < CompositorPrototype
      option :context, optional: false

      inheritance_strategy do
        base_tiles %w[1 2 3 4 5 6]
        advancement_tiles %w[A1 A2]
        accommodation_tiles %w[B1 B2]
      end

      def call
        shuffled_tiles = Shuffler.call(tiles:, positions:, tile_variant: :expert_tile)
        context.action_board_image = TilesPlacer.call(main_image: context.action_board_image, tiles: shuffled_tiles)
      end

      private

      def positions = [1]
    end
  end
end
