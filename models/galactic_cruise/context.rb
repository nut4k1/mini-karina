require 'dry-initializer'

module GalacticCruise
  class Context
    extend Dry::Initializer

    attr_accessor :action_board_image, :technology_board_image, :upgrade_token_board_image, :guest_bonus_board_image, :company_goal_board_image, :marketing_board_image, :cruises

    option :game_mode
    option :players_count
    option :cruises, optional: true

    option :action_board_image, optional: true
    option :technology_board_image, optional: true
    option :marketing_board_image, optional: true
    option :upgrade_token_board_image, optional: true
    option :guest_bonus_board_image, optional: true
    option :company_goal_board_image, optional: true
  end
end