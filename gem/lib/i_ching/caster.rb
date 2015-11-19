module IChing
  module Caster
    extend self
    class InvalidCaster < Exception
    end

    def with_method(method)
      if casting_method = available_casting_method(method)
        casting_method.new
      else
        raise InvalidCaster
      end
    end

    def available_casting_method(method)
      case method.to_sym
      when :yarrow then IChing::Casters::Yarrow
      when :coins then IChing::Casters::Coins
      when :random then IChing::Casters::Random
      else nil
      end
    end
  end
end
