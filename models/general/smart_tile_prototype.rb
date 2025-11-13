require "mini_magick"

class SmartTilePrototype
  attr_reader :geometry, :name, :image

  def initialize(tile_variant:, name:, position: 1)
    @tile_variant = tile_variant
    self.singleton_class.send(:prepend, constant_module)

    @name = name
    @position = position 
    @geometry = geometry_by_position[position]
    @image = MiniMagick::Image.open(image_path)
  end

  private

  def image_path = raise StandardError.new("no image_path implementation")
  def constant_module = raise StandardError.new("no constant_module implementation")
  def geometry_by_position = raise StandardError.new("no geometry_by_position implementation")
end