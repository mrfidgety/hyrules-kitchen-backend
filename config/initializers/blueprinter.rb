require 'blueprinter/json_api_transformer'
require 'blueprinter/json_api_association_extractor'

Blueprinter.configure do |config|
  config.default_transformers = [Blueprinter::JsonApiTransformer]
end

# Modify the default association behaviour to use a custom extractor
# to produce JSONAPI relationships
module Blueprinter
  class Base
    def self.association(method, options = {}, &block)
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
