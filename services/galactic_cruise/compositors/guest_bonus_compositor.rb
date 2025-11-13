require "./services/general/base_service.rb"
require './services/general/tiles_placer'
require './services/galactic_cruise/shuffler'

module GalacticCruise
  module Compositors
    class GuestBonusCompositor < BaseService
      option :context, optional: false
      
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
        
        -> (_) do
          ADVANCEMENTS.zip([1,2,3]).map { |name, position|
            SmartTile.new(tile_variant: :guest_bonus, name:, position:)
          }
        end
      end

      def positions = (1..3).to_a

      def tiles
        case context.game_mode
        when :base then BASE
        when :advancements then ADVANCEMENTS
        when :accommodations then ACCOMMODATIONS
        end
      end
      
      BASE = %w(ad credit reputation resource victory_point)
      ADVANCEMENTS = %w(orange purple mint)
      ACCOMMODATIONS = ADVANCEMENTS
    end
  end
end