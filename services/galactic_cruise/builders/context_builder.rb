require 'mini_magick'
require './services/general/service_prototype'
require './models/galactic_cruise/context'
require './constants/galactic_cruise/neutral_gear_setup'

module GalacticCruise
  module Builders
    class ContextBuilder < ServicePrototype
      option :game_mode
      option :players_count

      def call
        GalacticCruise::Context.new(
          game_mode:,
          players_count:,
          neutral_gears_setup: NeutralGearSetup.random,
          **images
        )
      end

      private

      def images
        {
          action_board_image: MiniMagick::Image.open('./sources/galactic_cruise/boards/action_board.webp'),
          technology_board_image: MiniMagick::Image.open('./sources/galactic_cruise/boards/technology_board.webp'),
          marketing_board_image: MiniMagick::Image.open('./sources/galactic_cruise/boards/marketing_board.webp'),
          upgrade_token_board_image: MiniMagick::Image.open('./sources/galactic_cruise/boards/upgrade_token_board.webp'),
          guest_bonus_board_image: MiniMagick::Image.open('./sources/galactic_cruise/boards/guest_bonus_board.webp'),
          company_goal_board_image: MiniMagick::Image.open('./sources/galactic_cruise/boards/company_goal_board.webp')
        }
      end
    end
  end
end
