# require "./tasks/galactic_cruise.rake"

Rake.add_rakelib 'tasks'
task default: %w[test]


# desc "Testing generation of all boards"
# require './services/galactic_cruise/compositors.rb'
# require './services/galactic_cruise/builders/context_builder.rb'
# task test: do
#   puts "Start Testing generation of all boards"
#   game_mode = :accommodations
#   players_count = 4
#   context = GalacticCruise::Builders::ContextBuilder.call(game_mode:, players_count:)
#   GalacticCruise::Compositors::ActionTileCompositor.call(context:)
#   GalacticCruise::Compositors::ExpertTileCompositor.call(context:)
#   GalacticCruise::Compositors::LocationBonusCompositor.call(context:)
#   context.action_board_image.write "./tmp/test_action_board_image.png"
#   puts "Generation saved at /tmp/test_action_board_image.png"
# end

# task default: galactic_cruise:generation:test
