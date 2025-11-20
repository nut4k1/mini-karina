require 'dry-initializer'

module GalacticCruise
  class Context
    extend Dry::Initializer

    attr_accessor :action_board_image,
                  :technology_board_image,
                  :upgrade_token_board_image,
                  :guest_bonus_board_image,
                  :company_goal_board_image,
                  :marketing_board_image,
                  :cruises,
                  :neutral_gears_setup

    option :game_mode
    option :players_count
    option :cruises, optional: true
    option :neutral_gears_setup

    option :action_board_image, optional: true
    option :technology_board_image, optional: true
    option :marketing_board_image, optional: true
    option :upgrade_token_board_image, optional: true
    option :guest_bonus_board_image, optional: true
    option :company_goal_board_image, optional: true

    def action_gear_positions
      return neutral_gears_setup[:actions] if players_count.in?([1, 2])

      [neutral_gears_setup[:actions].first]
    end

    def technology_gear_positions
      return [] if players_count == 4

      [neutral_gears_setup[:technologies]]
    end
  end
end
