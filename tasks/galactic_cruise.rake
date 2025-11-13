require "mini_magick"
require "rake/clean"
require "yaml"

# Rake.application.options.trace_rules = true

namespace :galactic_cruise do
  namespace :generate_fixtures do
    task :all => [
      :action_tiles,
      :expert_tiles,
      :location_bonuses,
      :technologies,
      :guest_bonuses,
      :cruises,
      :company_goals,
      :upgrade_tokens,
      :gear_meeples,
      :guest_meeples,
      :cruise_mocks
    ]

    GALACTIC_CRUISE_RESIZE_OPTIONS = YAML.load_file("./configs/galactic_cruise/resize_options.yml")
    ACTION_TILE_SOURCE_FILES = Rake::FileList.new("./sources/galactic_cruise/action_tiles/**/*.png")
    task :action_tiles => ACTION_TILE_SOURCE_FILES.pathmap("%{sources/,fixtures/}p")
    EXPERT_TILE_SOURCE_FILES = Rake::FileList.new("./sources/galactic_cruise/expert_tiles/**/*.png")
    task :expert_tiles => EXPERT_TILE_SOURCE_FILES.pathmap("%{sources/,fixtures/}p")
    LOCATION_BONUSES_SOURCE_FILES = Rake::FileList.new("./sources/galactic_cruise/location_bonuses/**/*.png")
    task :location_bonuses => LOCATION_BONUSES_SOURCE_FILES.pathmap("%{sources/,fixtures/}p")
    TECHNOLOGIES_SOURCE_FILES = Rake::FileList.new("./sources/galactic_cruise/technologies/**/*.png")
    task :technologies => TECHNOLOGIES_SOURCE_FILES.pathmap("%{sources/,fixtures/}p")
    GUEST_BONUSES_SOURCE_FILES = Rake::FileList.new("./sources/galactic_cruise/guest_bonuses/**/*.png")
    task :guest_bonuses => GUEST_BONUSES_SOURCE_FILES.pathmap("%{sources/,fixtures/}p")
    CRUISES_SOURCE_FILES = Rake::FileList.new("./sources/galactic_cruise/cruises/**/*.png")
    task :cruises => CRUISES_SOURCE_FILES.pathmap("%{sources/,fixtures/}p")
    COMPANY_GOALS_SOURCE_FILES = Rake::FileList.new("./sources/galactic_cruise/company_goals/**/*.png")
    task :company_goals => COMPANY_GOALS_SOURCE_FILES.pathmap("%{sources/,fixtures/}p")
    UPGRADE_TOKENS_SOURCE_FILES = Rake::FileList.new("./sources/galactic_cruise/upgrade_tokens/**/*.png")
    task :upgrade_tokens => UPGRADE_TOKENS_SOURCE_FILES.pathmap("%{sources/,fixtures/}p")
    GEAR_MEEPLES_SOURCE_FILES = Rake::FileList.new("./sources/galactic_cruise/gear_meeples/**/*.png")
    task :gear_meeples => GEAR_MEEPLES_SOURCE_FILES.pathmap("%{sources/,fixtures/}p")
    GUEST_MEEPLES_SOURCE_FILES = Rake::FileList.new("./sources/galactic_cruise/guest_meeples/*.png")
    task :guest_meeples => GUEST_MEEPLES_SOURCE_FILES.pathmap("%{sources/,fixtures/}p")
    CRUISE_MOCKS_SOURCE_FILES = Rake::FileList.new("./sources/galactic_cruise/cruise_mocks/*.png")
    task :cruise_mocks => CRUISE_MOCKS_SOURCE_FILES.pathmap("%{sources/,fixtures/}p")

    def resize_image(source:, target:, options:)
      image = MiniMagick::Image.open(source)
      image.resize(options)
      image.write(target)
    end
    def fixture_type_from_path(path) = path[/.*(galactic_cruise)\/([a-zA-z]*)\/?.*/, 2]

    rule %r{fixtures/galactic_cruise/.+\.png$} => ->(f){f.pathmap("%{fixtures/,sources/}p")} do |rake_task|
      fixture_type = fixture_type_from_path(rake_task.name)
      options = GALACTIC_CRUISE_RESIZE_OPTIONS[fixture_type]
      mkdir_p rake_task.name.pathmap("%d")
      resize_image(source: rake_task.source, target: rake_task.name, options:)
    end
  end

  namespace :test do
    require './services/galactic_cruise/compositors.rb'
    require './services/galactic_cruise/builders/context_builder.rb'
    task :action_board do
      puts "==Start Testing generation of action board=="
      game_mode = :accommodations
      players_count = 4
      context = GalacticCruise::Builders::ContextBuilder.call(game_mode:, players_count:)
      GalacticCruise::Compositors::ActionTileCompositor.call(context:)
      GalacticCruise::Compositors::ExpertTileCompositor.call(context:)
      GalacticCruise::Compositors::LocationBonusCompositor.call(context:)
      GalacticCruise::Compositors::NeutralDevelopmentCompositor.call(context:)
      context.action_board_image.write "./tmp/test_action_board_image.png"
      puts "==Generation saved at /tmp/test_action_board_image.png=="
    end

    task :technology_board do
      puts "==Start Testing generation of techno board=="
      game_mode = :accommodations
      players_count = 2
      context = GalacticCruise::Builders::ContextBuilder.call(game_mode:, players_count:)
      GalacticCruise::Compositors::TechnologyCompositor.call(context:)
      GalacticCruise::Compositors::NeutralDevelopmentCompositor.call(context:)
      context.action_board_image.write "./tmp/technology_board_image.png"
      puts "==Generation saved at /tmp/technology_board_image.png=="
    end

    task :upgrade_token_board do
      puts "==Start Testing generation of upgrade_token_board=="
      game_mode = :accommodations
      players_count = 2
      context = GalacticCruise::Builders::ContextBuilder.call(game_mode:, players_count:)
      GalacticCruise::Compositors::UpgradeTokenCompositor.call(context:)
      context.upgrade_token_board_image.write "./tmp/upgrade_token_board_image.png"
      puts "==Generation saved at /tmp/upgrade_token_board_image.png=="
    end

    task :guest_bonus_board do
      puts "==Start Testing generation of guest_bonus_board=="
      game_mode = :accommodations
      players_count = 2
      context = GalacticCruise::Builders::ContextBuilder.call(game_mode:, players_count:)
      GalacticCruise::Compositors::GuestBonusCompositor.call(context:)
      context.guest_bonus_board_image.write "./tmp/guest_bonus_board_image.png"
      puts "==Generation saved at /tmp/guest_bonus_board_image.png=="
    end

    task :company_goal_board do
      puts "==Start Testing generation of company_goal_board=="
      game_mode = :accommodations
      players_count = 2
      context = GalacticCruise::Builders::ContextBuilder.call(game_mode:, players_count:)
      GalacticCruise::Compositors::CompanyGoalCompositor.call(context:)
      context.company_goal_board_image.write "./tmp/company_goal_board_image.png"
      puts "==Generation saved at /tmp/company_goal_board_image.png=="
    end

    task :marketing_board do
      puts "==Start Testing generation of marketing_board=="
      game_mode = :accommodations
      players_count = 3
      context = GalacticCruise::Builders::ContextBuilder.call(game_mode:, players_count:)
      GalacticCruise::Compositors::CruiseCompositor.call(context:)
      GalacticCruise::Compositors::GuestCompositor.call(context:)
      context.marketing_board_image.write "./tmp/marketing_board_image.png"
      puts "==Generation saved at /tmp/marketing_board_image.png=="
    end
  end
end
