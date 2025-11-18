module TileCompositionStrategyConcern
  def self.included(base)
    base.extend ClassMethods
  end

  module ClassMethods
    def inheritance_strategy(&)
      @strategy ||= Strategy.new(:inheritance)
      @strategy.instance_eval(&)

      define_common_methods
    end

    def standalone_strategy(&)
      @strategy ||= Strategy.new(:standalone)
      @strategy.instance_eval(&)

      define_common_methods
    end

    def define_base_tiles
      define_method(:base_tiles) do
        @strategy ||= self.class.instance_variable_get(:@strategy)
        @strategy.base_tiles
      end
    end

    def define_advancement_tiles
      define_method(:advancement_tiles) do
        @strategy ||= self.class.instance_variable_get(:@strategy)
        @strategy.advancement_tiles
      end
    end

    def define_accommodation_tiles
      define_method(:accommodation_tiles) do
        @strategy ||= self.class.instance_variable_get(:@strategy)
        @strategy.accommodation_tiles
      end
    end

    def define_common_methods
      define_base_tiles and define_advancement_tiles and define_accommodation_tiles
    end
  end

  class Strategy
    def initialize(value)
      @type = value
      @base_tiles = []
      @advancement_tiles = []
      @accommodation_tiles = []
    end

    def base_tiles(value = nil)
      return @base_tiles unless value

      @base_tiles = value
    end

    def advancement_tiles(value = nil)
      return @advancement_tiles unless value

      @advancement_tiles = case @type
                           when :inheritance then [*base_tiles, *value]
                           when :standalone then value
                           end
    end

    def accommodation_tiles(value = nil)
      return @accommodation_tiles unless value

      @accommodation_tiles = case @type
                             when :inheritance then [*advancement_tiles, *value]
                             when :standalone then value
                             end
    end
  end
end
