module GalacticCruise
  module SmartTileVariants
    module UpgradeToken
      KEY = :upgrade_token

      def fixture_path = "#{super}upgrade_tokens/"

      def geometry_by_position
        {
          1 => '+24+729',
          2 => '+24+872',
          3 => '+169+729',
          4 => '+169+872'
        }
      end
    end
  end
end
