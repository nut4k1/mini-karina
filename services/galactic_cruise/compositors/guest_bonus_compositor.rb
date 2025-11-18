require_relative 'compositor_prototype'

module GalacticCruise
  module Compositors
    class GuestBonusCompositor < CompositorPrototype
      option :context, optional: false

      inheritance_strategy do
        base_tiles %w[ad credit reputation resource victory_point]
        advancement_tiles %w[orange purple mint]
      end

      def call
        shuffled_tiles = shuffler.call(tiles:, positions:, tile_variant: :guest_bonus)
        context.guest_bonus_board_image = TilesPlacer.call(
          main_image: context.guest_bonus_board_image,
          tiles: shuffled_tiles
        )
      end

      private

      def shuffler
        return Shuffler if context.game_mode == :base

        lambda do |_|
          ADVANCEMENTS.zip([1, 2, 3]).map do |name, position|
            SmartTile.new(tile_variant: :guest_bonus, name:, position:)
          end
        end
      end

      def positions = (1..3).to_a
    end
  end
end
