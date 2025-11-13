require "./services/general/base_service.rb"
require './services/general/tiles_placer'
require './services/galactic_cruise/shuffler'

module GalacticCruise
  module Compositors
    class LocationBonusCompositor < BaseService
      option :context, optional: false
      
      def call
        shuffled_tiles = Shuffler.call(tiles:, positions:, tile_variant: :location_bonus)
        context.action_board_image = TilesPlacer.call(main_image: context.action_board_image, tiles: shuffled_tiles)
      end

      private

      def positions = (1..6).to_a

      def tiles
        case context.game_mode
        when :base then BASE
        when :advancements then ADVANCEMENTS
        when :accommodations then ACCOMMODATIONS
        end
      end
      
      BASE = []
      ADVANCEMENTS = %w(ad agenda_card credit reputation resource victory_point)
      ACCOMMODATIONS = ADVANCEMENTS
    end
  end
end