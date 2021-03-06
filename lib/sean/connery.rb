require "sean/connery/version"

module Sean
  module Connery
    def self.included(base)
      base.extend(ClassMethods)
      # TODO - smarten up the replacement
      base.methods.find_all { |m| m.to_s.include?('s') }.each do |method|
        owner = base.method(method).owner
        owner.send :alias_method, method.to_s.gsub('s','sh').to_sym, method
      end
    end

    module ClassMethods
      # TODO - .new?
    end
  end
end
