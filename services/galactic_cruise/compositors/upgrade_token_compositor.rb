require_relative 'compositor_prototype'

module GalacticCruise
  module Compositors
    class UpgradeTokenCompositor < CompositorPrototype
      option :context, optional: false

      inheritance_strategy do
        base_tiles %w[4credits 4ads 4resources discounted_development]
        advancement_tiles %w[replace_worker action]
        accommodation_tiles %w[activate_segment 3reputation]
      end

      def call
        shuffled_tiles = shuffler.call(tiles:, positions:, tile_variant: :upgrade_token)
        context.upgrade_token_board_image = TilesPlacer.call(
          main_image: context.upgrade_token_board_image,
          tiles: shuffled_tiles
        )
      end

      private

      def shuffler = Shuffler
      def positions = (1..4).to_a
    end
  end
end
