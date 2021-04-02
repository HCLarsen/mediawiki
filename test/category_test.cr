require "minitest/autorun"
require "json"

require "/../src/mediawiki/category"

class CategoryTest < Minitest::Test
  def test_initializes_category
    json = File.read("test/files/iron-compounds1.json")
    parsed = JSON.parse(json)
    parsed_list = parsed.as_h["query"].as_h

    category = Wikipedia::Category.from_json(parsed_list.to_json)

    assert_equal 100, category.pages.size
    assert_equal 0, category.subcategories.size
  end
end
