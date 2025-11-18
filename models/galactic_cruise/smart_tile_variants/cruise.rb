module GalacticCruise
  module SmartTileVariants
    module Cruise
      KEY = :cruise

      def fixture_path = "#{super}cruises/"

      def geometry_by_position
        {
          6 => '+33+140',
          5 => '+33+445',
          4 => '+33+750',
          3 => '+33+1055',
          2 => '+33+1360',
          1 => '+33+1665'
        }
      end

      def meeples
        {
          B1: [:orange],
          B2: [:purple],
          B3: %i[purple orange],
          B4: %i[purple mint orange],
          B5: %i[purple mint orange],
          B6: %i[mint purple],
          B7: [:orange],
          B8: %i[mint orange],
          B9: %i[purple mint orange],
          B10: [:mint],
          B11: [:purple],
          B12: %i[orange mint],
          B13: %i[orange purple],
          B14: [:mint],
          B15: %i[mint orange]
        }[@name.to_sym]
      end
    end
  end
end
