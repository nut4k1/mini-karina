require "mini_magick"
require "./services/general/base_service.rb"
require "./models/galactic_cruise/context.rb"

module GalacticCruise
  module Builders
    class ContextBuilder < BaseService
      option :game_mode
      option :players_count

      def call
        GalacticCruise::Context.new(
          game_mode:,
          players_count:,
          # cruises: [],
          # neutral_development: [],
          **images
        )
      end

      private

      def images
        {
          action_board_image: MiniMagick::Image.open("./fixtures/galactic_cruise/boards/action_board.png"),
          technology_board_image: MiniMagick::Image.open("./fixtures/galactic_cruise/boards/technology_board.png"),
          marketing_board_image: MiniMagick::Image.open("./fixtures/galactic_cruise/boards/marketing_board.png"),
          upgrade_token_board_image: MiniMagick::Image.open("./fixtures/galactic_cruise/boards/upgrade_token_board.png"),
          guest_bonus_board_image: MiniMagick::Image.open("./fixtures/galactic_cruise/boards/guest_bonus_board.png"),
          company_goal_board_image: MiniMagick::Image.open("./fixtures/galactic_cruise/boards/company_goal_board.png")
        }
      end
    end
  end
end