require './services/general/service_prototype'
class ShufflerPrototype < ServicePrototype
  option :tiles, optional: false
  option :positions, optional: false
  option :tile_variant, optional: false

  def call
    tiles
      .sample(positions.count)
      .zip(positions.shuffle)
      .map { |name, position| tile_class.new(tile_variant:, name:, position:) }
  end

  def tile_class = raise StandardError, 'no tile_class implementation'
end
