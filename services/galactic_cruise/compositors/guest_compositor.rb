require "./services/general/base_service.rb"
require './services/general/tiles_placer'
require './services/galactic_cruise/shuffler'

module GalacticCruise
  module Compositors
    class GuestCompositor < BaseService
      option :context, optional: false
      
      def call
        shuffled_tiles = Shuffler.call(tiles:, positions:, tile_variant: :guest_meeple)
        context.marketing_board_image = TilesPlacer.call(
          main_image: context.marketing_board_image,
          tiles: shuffled_tiles
        )
      end

      private

      def positions = (1..tiles.count).to_a
      def tiles
        meeples = context.cruises.flat_map(&:meeples)

        limit = case context.players_count
        when 4 then 11
        when 3 then 9
        else
          7
        end
 
        maximized_meeples(meeples, limit)
      end

      def maximized_meeples(meeples, limit)
        return meeples if meeples.count >= limit
        
        maximized_meeples([*meeples, :orange, :mint, :purple], limit)
      end
    end
  end
end