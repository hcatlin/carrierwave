# This is basically a copy of ActiveSupport::Concern
# http://github.com/rails/rails/blob/4e50a35fa243f6cf7ad567774a9f7c1cb87a1653/activesupport/lib/active_support/concern.rb
#
# This was a (useful) extension added in Rails 3.0+. Since its not available in the Rails 2 
# series, we have added it manually this way as to not mess up the dependencies.
#

module CarrierWave
  module CarrierWave::Concern
    def self.extended(base)
      base.instance_variable_set("@_dependencies", [])
    end
    
    def included(base = nil, &block)
      if base.nil?
        @_included_block = block
      else
        super
      end
    end

    def append_features(base)
      if base.instance_variable_defined?("@_dependencies")
        base.instance_variable_get("@_dependencies") << self
        return false
      else
        return false if base < self
        @_dependencies.each { |dep| base.send(:include, dep) }
        super
        base.extend const_get("ClassMethods") if const_defined?("ClassMethods")
        base.send :include, const_get("InstanceMethods") if const_defined?("InstanceMethods")
        base.class_eval(&@_included_block) if instance_variable_defined?("@_included_block")
      end
    end
  end
end