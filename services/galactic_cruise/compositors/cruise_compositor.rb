require "./services/general/base_service.rb"
require './services/general/tiles_placer'
require './services/galactic_cruise/shuffler'

module GalacticCruise
  module Compositors
    class CruiseCompositor < BaseService
      option :context, optional: false
      
      def call
        shuffled_tiles = shuffler.call(tiles:, positions:, tile_variant: :cruise)
        context.cruises = shuffled_tiles
        context.marketing_board_image = TilesPlacer.call(
          main_image: context.marketing_board_image,
          tiles: shuffled_tiles_with_mocks(shuffled_tiles)
        )
      end

      private

      def shuffled_tiles_with_mocks(tiles)
        return tiles if tiles.count == 6
        
        mock = SmartTile.new(tile_variant: :cruise_mock, position: tiles.count + 1, name: "cruise_mock")
        shuffled_tiles_with_mocks([*tiles, mock])
      end

      def shuffler = Shuffler  
      def positions = (1..last_position).to_a
      def last_position = 2 + [context.players_count, 2].max
      def tiles = (1..15).map(&:to_s).map(&"B".method(:+))
    end
  end
end