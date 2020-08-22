RSpec.configure do
  def parse_json(response, struct: false)
    JSON.parse(response, object_class: struct ? OpenStruct : Hash)
  end
end
