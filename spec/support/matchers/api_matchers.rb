require 'rspec/expectations'

RSpec::Matchers.define :render_primary_resources do |_expected|
  match do |_actual|
    expect(actual_resource_ids).to match_array expected_ids
  end

  failure_message do |_actual|
    "expected primary resources with ids \"#{expected_ids}\", " \
      "got \"#{actual_resource_ids}\""
  end

  def actual_resource_ids
    @actual_resource_ids ||= parse_json(actual.body, struct: true).data.map(&:id)
  end

  def expected_ids
    expected.map(&:id)
  end
end

RSpec::Matchers.define :render_primary_resource do |_expected|
  match do |_actual|
    expect(actual_resource.id).to eq expected.id
    expect(actual_resource.type).to eq expected.class.name.tableize
  end

  failure_message do |_actual|
    "expected primary resource of type '#{expected.class.name.tableize}' with id '#{expected.id}'" \
    ", got #{actual_resource}"
  end

  def actual_resource
    @actual_resource ||= parse_json(actual.body, struct: true).data
  end
end

RSpec::Matchers.define :have_top_level_links do |expected|
  match do |response|
    expected_links =
      expected.map do |(key, expected_path)|
        links_key_present?(response) &&
          (actual_url_for_key(response, key) == expected_url(expected_path))
      end

    expected_links.all?
  end

  failure_message do |response|
    if links_key_present?(response)
      "expected links '#{expected}' but got links " \
      "#{parse_json(response.body)['links']}'"
    else
      "expected root level key 'links', but got keys " \
      "#{parse_json(response.body)['keys']}"
    end
  end

  def expected_url(path)
    "http://www.example.com/api/v1#{path}"
  end

  def links_key_present?(response)
    parse_json(response.body).keys.include? 'links'
  end

  def actual_url_for_key(response, key)
    parse_json(response.body).dig('links', key.to_s)&.split('?')&.first
  end
end
