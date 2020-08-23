module Blueprinter
  class JsonApiAssociationExtractor < Extractor
    def extract(association_name, object, local_options, options={})
      {
        data: {
          id: object.public_send("#{association_name}_id"),
          type: association_name.to_s.tableize
        }
      }
    end
  end
end