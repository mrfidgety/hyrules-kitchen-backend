module Blueprinter
  class DasherizeKeysTransformer < Blueprinter::Transformer
    def transform(hash, object, _options)
      hash.deep_transform_keys! { |key| key.to_s.dasherize.to_sym }
    end
  end
end
