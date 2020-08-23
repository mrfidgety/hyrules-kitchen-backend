require 'blueprinter/json_api_transformer'
require 'blueprinter/json_api_association_extractor'

Blueprinter.configure do |config|
  config.default_transformers = [Blueprinter::JsonApiTransformer]
end

module Blueprinter
  class Base
    def self.association(method, options = {}, &block)
      # Blueprinter validation removed since our custom extractor does not require one

      field(
        method,
        options.merge(
          association: true,
          extractor: options.fetch(:extractor) { JsonApiAssociationExtractor.new }
        ),
        &block
      )
    end
  end
end
