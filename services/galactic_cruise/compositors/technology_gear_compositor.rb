require './services/general/service_prototype'
require './services/general/tiles_placer'
require './services/galactic_cruise/shuffler'
require 'yaml'
require './models/galactic_cruise/smart_tile'
require 'active_support/core_ext/object/inclusion'
require 'active_support/core_ext/object/blank'

module GalacticCruise
  module Compositors
    class TechnologyGearCompositor < ServicePrototype
      option :context

      def call
        return if context.technology_gear_positions.empty?

        shuffled_tiles = Shuffler.call(
          tiles: ['gear'],
          positions: context.technology_gear_positions,
          tile_variant: :technology_gear
        )
        context.technology_board_image = TilesPlacer.call(
          main_image: context.technology_board_image,
          tiles: shuffled_tiles
        )
      end
    end
  end
end
