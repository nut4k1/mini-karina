require "./services/general/base_service.rb"
require './services/general/tiles_placer'
require './services/galactic_cruise/shuffler'

module GalacticCruise
  module Compositors
    class CompanyGoalCompositor < BaseService
      option :context, optional: false
      
      def call
        shuffled_tiles = shuffler.call(tiles:, positions:, tile_variant: :company_goal)
        context.company_goal_board_image = TilesPlacer.call(
          main_image: context.company_goal_board_image,
          tiles: shuffled_tiles
        )
      end

      private

      def shuffler = Shuffler
      def positions = [1]
      def tiles = (1..6).map(&:to_s)
    end
  end
end