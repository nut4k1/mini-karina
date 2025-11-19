module DlcTileStrategyConcern
  def self.included(base)
    base.extend DSLMethods
  end

  def initialize(*, **)
    set_dsl_vars
    super
  end

  module DSLMethods
    def self.extended(base)
      define_default_setters(base)

      base.define_method(:base_tiles) { instance_variable_get(:@base_tiles) }
      base.define_method(:advancement_tiles) { instance_variable_get(:@advancement_tiles) }
      base.define_method(:accommodation_tiles) { instance_variable_get(:@accommodation_tiles) }

      base.define_method(:set_dsl_vars) do
        set_base_tiles and set_advancement_tiles and set_accommodation_tiles
      end
    end

    def define_default_setters(base)
      base.define_method(:set_base_tiles) do
        instance_variable_set(:@base_tiles, [])
      end

      base.define_method(:set_advancement_tiles) do
        instance_variable_set(:@advancement_tiles, instance_variable_get(:@base_tiles))
      end

      base.define_method(:set_accommodation_tiles) do
        instance_variable_set(:@accommodation_tiles, instance_variable_get(:@advancement_tiles))
      end
    end

    def standalone_strategy # rubocop:disable Metrics/MethodLength
      singleton_class.define_method(:base_tiles) do |value|
        define_method(:set_base_tiles) do
          instance_variable_set(:@base_tiles, value)
        end
      end
      singleton_class.define_method(:advancement_tiles) do |value|
        define_method(:set_advancement_tiles) do
          instance_variable_set(:@advancement_tiles, value)
        end
      end
      singleton_class.define_method(:accommodation_tiles) do |value|
        define_method(:set_accommodation_tiles) do
          instance_variable_set(:@accommodation_tiles, value)
        end
      end

      yield
    end

    def mixed_strategy # rubocop:disable Metrics/MethodLength
      singleton_class.define_method(:base_tiles) do |value|
        define_method(:set_base_tiles) do
          instance_variable_set(:@base_tiles, value)
        end
      end
      singleton_class.define_method(:advancement_tiles) do |value|
        define_method(:set_advancement_tiles) do
          instance_variable_set(
            :@advancement_tiles,
            [*value, *instance_variable_get(:@base_tiles)]
          )
        end
      end
      singleton_class.define_method(:accommodation_tiles) do |value|
        define_method(:set_accommodation_tiles) do
          instance_variable_set(
            :@accommodation_tiles,
            [*value, *instance_variable_get(:@advancement_tiles)]
          )
        end
      end

      yield
    end
  end
end
