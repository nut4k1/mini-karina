require './services/general/service_prototype'
require './services/general/tiles_placer'
require './services/galactic_cruise/shuffler'
require './services/galactic_cruise/concerns/dlc_tile_strategy_concern'

module GalacticCruise
  module Compositors
    class CompositorPrototype < ServicePrototype
      include DlcTileStrategyConcern

      option :context, optional: false

      def call = raise StandardError, 'not implemented'

      private

      def tiles_placer = TilesPlacer
      def shuffler = Shuffler

      def tiles
        case context.game_mode
        when :base then base_tiles
        when :advancement then advancement_tiles
        when :accommodation then accommodation_tiles
        end
      end
    end
  end
end
