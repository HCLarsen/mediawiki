require "minitest/autorun"
require "json"

require "/../src/mediawiki/client"
require "./webmocks.cr"

class ClientTest < Minitest::Test
  def initialize(args)
    super(args)
    @client = Wikipedia::Client.new("en.wikipedia.org")
  end

  def test_gets_page
    page = @client.get_page("Cementite")

    assert_equal "Cementite", page.title
  end

  def test_gets_page_from_wikibooks
    @client = Wikipedia::Client.new("en.wikibooks.org")

    page = @client.get_page("Main Page")
    assert_equal "Main Page", page.title
  end

  def test_gets_category_info
    category = @client.get_category("Iron compounds")

    assert_equal 105, category.pages.size
    assert_equal 10, category.subcategories.size
    assert_equal 2, category.files.size
  end

  def test_gets_large_category
    category = @client.get_category("Category:20th-century composers")

    assert_equal 1001, category.pages.size
    assert_equal 18, category.subcategories.size
  end
end
