module GalacticCruise
  module SmartTileVariants
    module CompanyGoal
      ACTION_IMAGE_PATH = "./fixtures/galactic_cruise/company_goals/"
      ACTION_IMAGE_POSTFIX = ".png"
      KEY = :company_goal

      def geometry_by_position
        { 1 => "+14+510" }
      end

      def image_path
        [
          ACTION_IMAGE_PATH,
          name,
          ACTION_IMAGE_POSTFIX
        ].join("")
      end
    end
  end
end