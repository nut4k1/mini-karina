require "./services/general/base_service.rb"
require './services/general/tiles_placer'
require './services/galactic_cruise/shuffler'

module GalacticCruise
  module Compositors
    class UpgradeTokenCompositor < BaseService
      option :context, optional: false
      
      def call
        shuffled_tiles = Shuffler.call(tiles:, positions:, tile_variant: :upgrade_token)
        context.upgrade_token_board_image = TilesPlacer.call(
          main_image: context.upgrade_token_board_image,
          tiles: shuffled_tiles
        )
      end

      private

      def positions = (1..4).to_a

      def tiles
        case context.game_mode
        when :base then BASE
        when :advancements then ADVANCEMENTS
        when :accommodations then ACCOMMODATIONS
        end
      end
      
      BASE = %w(4credits 4ads 4resources discounted_development)
      ADVANCEMENTS = BASE + %w(replace_worker action)
      ACCOMMODATIONS = ADVANCEMENTS + %w(activate_segment 3reputation)
    end
  end
end