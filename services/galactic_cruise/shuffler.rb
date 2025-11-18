require './services/general/shuffler_prototype'
require './models/galactic_cruise/smart_tile'

module GalacticCruise
  class Shuffler < ShufflerPrototype
    def tile_class = SmartTile
  end
end
