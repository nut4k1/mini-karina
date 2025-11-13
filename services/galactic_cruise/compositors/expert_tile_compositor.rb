require "./services/general/base_service.rb"
require './services/general/tiles_placer'
require './services/galactic_cruise/shuffler'

module GalacticCruise
  module Compositors
    class ExpertTileCompositor < BaseService
      option :context, optional: false
      
      def call
        shuffled_tiles = Shuffler.call(tiles:, positions:, tile_variant: :expert_tile)
        context.action_board_image = TilesPlacer.call(main_image: context.action_board_image, tiles: shuffled_tiles)
      end

      private

      def positions = [1]

      def tiles
        case context.game_mode
        when :base then BASE
        when :advancements then ADVANCEMENTS
        when :accommodations then ACCOMMODATIONS
        end
      end
      
      BASE = %w(1 2 3 4 5 6)
      ADVANCEMENTS = BASE + %w(A1 A2)
      ACCOMMODATIONS = ADVANCEMENTS + %w(B1 B2)
    end
  end
end