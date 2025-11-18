require './models/general/smart_tile_prototype'
require_relative 'smart_tile_variants'

class String
  def constantize
    to_s.split('::').reduce(Module) { |m, c| m.const_get(c) }
  end
end

module GalacticCruise
  class SmartTile < SmartTilePrototype
    IMAGE_EXTENTION = '.webp'.freeze
    FOLDER_PATH = './fixtures/galactic_cruise/'.freeze

    def fixture_path = FOLDER_PATH
    def image_path = [fixture_path, @name, IMAGE_EXTENTION].join
    def constant_module = "GalacticCruise::SmartTileVariants::#{tile_variant_class}".constantize
    def tile_variant_class = @tile_variant.to_s.split('_').map(&:capitalize).join
  end
end
