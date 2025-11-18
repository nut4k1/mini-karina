require 'mini_magick'
require 'yaml'

# Rake.application.options.trace_rules = true

require './services/galactic_cruise/compositors'
require './services/galactic_cruise/builders/context_builder'
namespace :galactic_cruise do
  namespace :test do
    task :action_board do
      puts '==Start Testing generation of action board=='
      game_mode = :accommodations
      players_count = 4
      context = GalacticCruise::Builders::ContextBuilder.call(game_mode:, players_count:)
      GalacticCruise::Compositors::ActionTileCompositor.call(context:)
      GalacticCruise::Compositors::ExpertTileCompositor.call(context:)
      GalacticCruise::Compositors::LocationBonusCompositor.call(context:)
      GalacticCruise::Compositors::NeutralDevelopmentCompositor.call(context:)
      context.action_board_image.write './tmp/test_action_board_image.png'
      puts '==Generation saved at /tmp/test_action_board_image.png=='
    end

    task :technology_board do
      puts '==Start Testing generation of techno board=='
      game_mode = :accommodations
      players_count = 2
      context = GalacticCruise::Builders::ContextBuilder.call(game_mode:, players_count:)
      GalacticCruise::Compositors::TechnologyCompositor.call(context:)
      GalacticCruise::Compositors::NeutralDevelopmentCompositor.call(context:)
      context.action_board_image.write './tmp/technology_board_image.png'
      puts '==Generation saved at /tmp/technology_board_image.png=='
    end

    task :upgrade_token_board do
      puts '==Start Testing generation of upgrade_token_board=='
      game_mode = :accommodations
      players_count = 2
      context = GalacticCruise::Builders::ContextBuilder.call(game_mode:, players_count:)
      GalacticCruise::Compositors::UpgradeTokenCompositor.call(context:)
      context.upgrade_token_board_image.write './tmp/upgrade_token_board_image.png'
      puts '==Generation saved at /tmp/upgrade_token_board_image.png=='
    end

    task :guest_bonus_board do
      puts '==Start Testing generation of guest_bonus_board=='
      game_mode = :accommodations
      players_count = 2
      context = GalacticCruise::Builders::ContextBuilder.call(game_mode:, players_count:)
      GalacticCruise::Compositors::GuestBonusCompositor.call(context:)
      context.guest_bonus_board_image.write './tmp/guest_bonus_board_image.png'
      puts '==Generation saved at /tmp/guest_bonus_board_image.png=='
    end

    task :company_goal_board do
      puts '==Start Testing generation of company_goal_board=='
      game_mode = :accommodations
      players_count = 2
      context = GalacticCruise::Builders::ContextBuilder.call(game_mode:, players_count:)
      GalacticCruise::Compositors::CompanyGoalCompositor.call(context:)
      context.company_goal_board_image.write './tmp/company_goal_board_image.png'
      puts '==Generation saved at /tmp/company_goal_board_image.png=='
    end

    task :marketing_board do
      puts '==Start Testing generation of marketing_board=='
      game_mode = :accommodations
      players_count = 3
      context = GalacticCruise::Builders::ContextBuilder.call(game_mode:, players_count:)
      GalacticCruise::Compositors::CruiseCompositor.call(context:)
      GalacticCruise::Compositors::GuestCompositor.call(context:)
      context.marketing_board_image.write './tmp/marketing_board_image.png'
      puts '==Generation saved at /tmp/marketing_board_image.png=='
    end
  end
end
