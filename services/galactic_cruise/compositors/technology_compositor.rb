require "./services/general/base_service.rb"
require './services/general/tiles_placer'
require './services/galactic_cruise/shuffler'

module GalacticCruise
  module Compositors
    class TechnologyCompositor < BaseService
      option :context, optional: false
      
      def call
        shuffled_tiles = shuffler.call(tiles:, positions:, tile_variant: :technology)
        context.technology_board_image = TilesPlacer.call(
          main_image: context.technology_board_image,
          tiles: shuffled_tiles
        )
      end

      private

      def shuffler = Shuffler  
      def positions = (1..4).to_a
      def tiles
        [
          *(1..8).map(&:to_s).map(&"A".method(:+)),
          *(3..4).map(&:to_s).map(&"B".method(:+))
        ]
      end
    end
  end
end