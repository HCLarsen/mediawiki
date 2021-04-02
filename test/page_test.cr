require "minitest/autorun"
require "json"

require "/../src/mediawiki/page"

class PageTest < Minitest::Test
  def test_initializes_page
    json = File.read("test/files/cementite.json")
    parsed = JSON.parse(json)
    parsed_page = parsed["query"]["pages"].as_a.first

    page = Wikipedia::Page.from_json(parsed_page.to_json)

    assert_equal 233281, page.pageid
    assert_equal "Cementite", page.title

    assert page.content.starts_with?("{{Steels}}\n'''Cementite''' ")

    assert page.categories.includes?("Category:Iron compounds")
  end
end
