require './services/general/service_prototype'
require './services/general/tiles_placer'
require './services/galactic_cruise/shuffler'

module GalacticCruise
  module Compositors
    class ActionGearCompositor < ServicePrototype
      option :context

      def call
        return if context.action_gear_positions.empty?

        shuffled_tiles = Shuffler.call(
          tiles: ['gear'] * context.action_gear_positions.size,
          positions: context.action_gear_positions,
          tile_variant: :action_gear
        )
        context.action_board_image = TilesPlacer.call(
          main_image: context.action_board_image,
          tiles: shuffled_tiles
        )
      end
    end
  end
end
