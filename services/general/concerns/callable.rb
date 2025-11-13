require "active_support/concern"

module Callable
  extend ActiveSupport::Concern

  class_methods do
    def call(...)
      new(...).()
    end

    alias_method :call!, :call
  end
end
