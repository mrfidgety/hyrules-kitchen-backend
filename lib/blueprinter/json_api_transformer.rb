module Blueprinter
  class JsonApiTransformer < Blueprinter::Transformer
    def transform(hash, object, _options)
      relationship_keys = hash.select { |_key, value| value.is_a?(Hash) }.keys
      relationships_hash = hash.extract!(*relationship_keys)

      hash.merge!(
        type: object.class.name.tableize,
        attributes: hash.slice!(:id)
      )

      hash[:relationships] = relationships_hash if relationships_hash.present?
    end
  end
end
