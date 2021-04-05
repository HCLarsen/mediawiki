require "http"

require "./category"
require "./page"

module Wikipedia
  class Client
    BASE_URL = "https://en.wikipedia.org/w/api.php"

    @base_url : String
    def initialize(@base_url : String); end

    def get_page(name : String) : Wikipedia::Page
      params = {
        "action" => "query",
        "prop" => "revisions|categories",
        "titles" => name,
        "rvslots" => "main",
        "rvprop" => "content",
        "format" => "json",
        "formatversion" => "2",
      }

      response = get(params)
      parsed_page = response["query"]["pages"].as_a.first

      page = Wikipedia::Page.from_json(parsed_page.to_json)
    end

    def get_category(name : String) : Wikipedia::Category
      prefix = "Category:"
      if name.starts_with?(prefix)
        category_name = name
      else
        category_name = prefix + name
      end

      params = {
        "action" => "query",
        "list" => "categorymembers",
        "cmtitle" => category_name,
        "cmlimit" => "500",
        "format" => "json",
        "formatversion" => "2",
      }

      parsed_list = get_category_members(params)
      categorymembers = { "categorymembers" => parsed_list }

      Wikipedia::Category.from_json(categorymembers.to_json)
    end

    private def get_category_members(params : Hash(String, String)) : Array(JSON::Any)
      json = get(params)
      parsed_list = json["query"]["categorymembers"].as_a

      if continue = json["continue"]?
        new_params = params
        new_params["cmcontinue"] = continue["cmcontinue"].to_s
        parsed_list += get_category_members(new_params)
      end

      parsed_list
    end

    private def get(params : Hash(String, String)) : JSON::Any
      url = "https://#{@base_url}/w/api.php?" + URI::Params.encode(params)

      response = HTTP::Client.get(url)
      json = JSON.parse(response.body)
    end
  end
end
