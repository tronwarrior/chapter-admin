module DynamicDefaultScoping
  extend ActiveSupport::Concern

  included do
    @relation = nil
  end

  module ClassMethods
    def default_scope name, options = nil
      if options.present?
        scope name, options
      else
        name, options = nil, name
      end

      reset_scoped_methods

      scoping = self.default_scoping.dup
      last = scoping.pop

      scope = if last.respond_to?(:call) || options.respond_to?(:call)
        lambda do
          construct_finder_arel \
            options.respond_to?(:call) ? options.call : options,
            last.respond_to?(:call)    ? last.call    : last
        end
      else
        construct_finder_arel options, last
      end

      self.default_scoping = scoping << scope
    end

    def scoped options = nil
      if options
        scoped.apply_finder_options options
      else
        last = current_scoped_methods
        last ? relation.merge(last) : relation.clone
      end
    end

    protected

    def current_scoped_methods
      method = scoped_methods.last
      method.kind_of?(Proc) ? unscoped(&method) : method
    end

    private

    def relation
      @relation ||= DynamicDefaultScoping::Relation.new self, arel_table
      finder_needs_type_condition? ? @relation.where(type_condition) : @relation
    end
  end

  class Relation < ::ActiveRecord::Relation
    protected

    def method_missing method, *args, &block
      if @klass.scopes[method].present?
        merge @klass.unscoped { @klass.send method, *args, &block }
      else
        super
      end
    end
  end
end
