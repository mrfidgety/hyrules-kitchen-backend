module Blueprinter
  class JsonApiAssociationExtractor < Extractor
    def extract(association_name, object, local_options, options={})
      if object.respond_to?("#{association_name}_id")
        data_hash_for_association(object, association_name)
      else
        object.public_send("#{association_name.to_s.singularize}_ids").map do |id|
          data_hash_for_association(object, association_name, id)
        end
      end
    end

    private

    def data_hash_for_association(object, association_name, id = nil)
      id ||= object.public_send("#{association_name}_id")

      { data: { id: id, type: association_name.to_s.tableize } }
    end
  end
end