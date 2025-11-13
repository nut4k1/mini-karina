require 'dry-initializer'
require_relative "concerns/callable.rb"

class BaseService
  extend Dry::Initializer
  include Callable
end