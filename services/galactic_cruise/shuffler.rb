require './services/general/shuffler_prototype.rb'
require "./models/galactic_cruise/smart_tile.rb"

module GalacticCruise
  class Shuffler < ShufflerPrototype
    def tile_class = SmartTile
  end
end
