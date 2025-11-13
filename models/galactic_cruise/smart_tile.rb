require "./models/general/smart_tile_prototype.rb"
require_relative "smart_tile_variants.rb"

class String
  def constantize
    return self.to_s.split('::').reduce(Module){ |m, c| m.const_get(c) }
  end
end

module GalacticCruise
  class SmartTile < SmartTilePrototype
    def constant_module = "GalacticCruise::SmartTileVariants::#{tile_variant_class}".constantize
    def tile_variant_class = @tile_variant.to_s.split("_").map(&:capitalize).join("")
  end
end