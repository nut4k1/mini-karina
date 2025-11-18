require_relative 'compositor_prototype'

module GalacticCruise
  module Compositors
    class LocationBonusCompositor < CompositorPrototype
      option :context, optional: false

      inheritance_strategy do
        base_tiles %w[ad agenda_card credit reputation resource victory_point]
      end

      def call
        shuffled_tiles = Shuffler.call(tiles:, positions:, tile_variant: :location_bonus)
        context.action_board_image = TilesPlacer.call(main_image: context.action_board_image, tiles: shuffled_tiles)
      end

      private

      def positions = (1..6).to_a
    end
  end
end
