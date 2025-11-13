require "./services/general/base_service.rb"
require './services/general/tiles_placer'
require './services/galactic_cruise/shuffler'
require "yaml"
require "./models/galactic_cruise/smart_tile.rb"
require "active_support/core_ext/object/inclusion.rb"
require "active_support/core_ext/object/blank.rb"

module GalacticCruise
  module Compositors
    class NeutralDevelopmentCompositor < BaseService
      option :context, optional: false
      
      def call
        action_gears, technology_gears = NeutralDevelopmentShuffler.call(players_count: context.players_count)
        context.action_board_image = TilesPlacer.call(main_image: context.action_board_image, tiles: action_gears)
        return if technology_gears.nil?

        context.technology_board_image = TilesPlacer.call(
          main_image: context.technology_board_image,
          tiles: technology_gears
        )
      end

      private

    end

    class NeutralDevelopmentShuffler < BaseService
      option :players_count

      def call
        conf = JSON.load_file("./configs/galactic_cruise/neutral_developments.json")
        setup = conf[(1..10).map(&:to_s).sample]
        build_tile = ->(tile_variant, position) { SmartTile.new(tile_variant:, name: "gear", position:) }
        action_gears = [build_tile.call(:action_gear, setup["actions"].first)]
        action_gears << build_tile.call(:action_gear, setup["actions"].last) if context.players_count.in?([1, 2])
        technology_gears = [build_tile.call(:technology_gear, setup["technologies"])] if context.players_count != 4
        [action_gears, technology_gears]
      end
    end
  end
end