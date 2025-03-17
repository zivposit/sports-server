module Serializer
  class BaseSerializer
    include JSONAPI::Serializer

    def self.camelize_keys(data)
      data.deep_transform_keys { |key| key.to_s.camelize(:lower) }
    end

    def serializable_hash(*args)
      self.class.camelize_keys(super)
    end
  end
end
