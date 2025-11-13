require "mini_magick"
require './services/general/base_service.rb'

class TilesPlacer < BaseService
  option :main_image, optional: false
  option :tiles, optional: false

  def call
    tiles.reduce(main_image) do |result, tile|
      result.composite(tile.image) do |composite|
        composite.compose "Over"
        composite.geometry tile.geometry
      end
    end
  end
end