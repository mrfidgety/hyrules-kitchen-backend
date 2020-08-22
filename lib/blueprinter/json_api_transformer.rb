module Blueprinter
  class JsonApiTransformer < Blueprinter::Transformer
    def transform(hash, object, _options)
      hash.merge!(
        type: object.class.name.tableize,
        attributes: hash.slice!(:id)
      )
    end
  end
end
