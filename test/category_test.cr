require "minitest/autorun"
require "json"

require "/../src/mediawiki/category"

class CategoryTest < Minitest::Test
  def test_initializes_category
    json = File.read("test/files/iron-compounds.json")
    parsed = JSON.parse(json)
    parsed_list = parsed.as_h["query"].as_h

    category = Wikipedia::Category.from_json(parsed_list.to_json)

    assert_equal 105, category.pages.size
    assert_equal 10, category.subcategories.size
  end
end
