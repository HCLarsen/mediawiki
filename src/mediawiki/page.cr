require "json"

module Wikipedia
  module ContentConverter
    def self.from_json(value : JSON::PullParser) : String
      value.read_begin_array
      value.read_begin_object
      value.read_object_key
      value.read_begin_object
      value.read_object_key
      value.read_begin_object
      value.read_object_key
      value.read_string
      value.read_object_key
      value.read_string
      value.read_object_key
      content = value.read_string
      value.read_end_object
      value.read_end_object
      value.read_end_object
      value.read_end_array

      return content
    end
  end

  module CategoryConverter
    def self.from_json(value : JSON::PullParser) : Array(String)
      categories = [] of String
      value.read_array do
        value.read_object do |key|
          case key
          when "ns"
            value.read_int
          when "title"
            categories << value.read_string
          end
        end
      end

      categories
    end
  end

  class Page
    include JSON::Serializable

    @[JSON::Field]
    getter pageid : Int32

    @[JSON::Field]
    getter title : String

    @[JSON::Field(key: "revisions", converter: Wikipedia::ContentConverter)]
    getter content : String

    @[JSON::Field(converter: Wikipedia::CategoryConverter)]
    getter categories : Array(String)
  end
end
