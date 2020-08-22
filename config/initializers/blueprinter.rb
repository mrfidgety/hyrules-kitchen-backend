require 'blueprinter/json_api_transformer'

Blueprinter.configure do |config|
  config.default_transformers = [Blueprinter::JsonApiTransformer]
end
