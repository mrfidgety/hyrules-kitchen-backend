module Blueprinter
  class JsonApiTransformer < Blueprinter::Transformer
    def transform(hash, object, _options)
      relationships_hash = hash.extract!(*object.class.reflect_on_all_associations.map(&:name))

      hash.merge!(
        type: object.class.name.tableize,
        attributes: hash.slice!(:id)
      )

      hash[:relationships] = relationships_hash if relationships_hash.present?
    end
  end
end
