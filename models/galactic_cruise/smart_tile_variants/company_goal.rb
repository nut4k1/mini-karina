module GalacticCruise
  module SmartTileVariants
    module CompanyGoal
      KEY = :company_goal

      def fixture_path = "#{super}company_goals/"
      def geometry_by_position = { 1 => '+14+510' }
    end
  end
end
