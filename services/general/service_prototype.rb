require 'dry-initializer'
require_relative 'concerns/callable'

class ServicePrototype
  extend Dry::Initializer
  include Callable
end
