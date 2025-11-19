require_relative 'compositor_prototype'

module GalacticCruise
  module Compositors
    class ActionTileCompositor < CompositorPrototype
      option :context, optional: false

      mixed_strategy do
        base_tiles %w[
          build_a_development
          hire_an_expert_worker
          purchase_supplies
          acquire_blueprints
          build_ship_segments
          acquire_new_ship
          gain_resources
          refill_storage_silo
          schedule_a_cruise
          advertise_for_a_cruise
          draw_agenda_cards
          refill_agenda_cards
        ]
      end

      def call
        shuffled_tiles = Shuffler.call(tiles:, positions:, tile_variant: :action_tile)
        context.action_board_image = TilesPlacer.call(main_image: context.action_board_image, tiles: shuffled_tiles)
      end

      private

      def positions = (1..12).to_a
    end
  end
end
