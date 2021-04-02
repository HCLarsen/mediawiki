require "json"

module Wikipedia
  class Category
    include JSON::Serializable

    @[JSON::Field]
    @categorymembers : Array(NamedTuple(title: String, ns: Int32, pageid: Int32))
    @pages : Array(NamedTuple(title: String, ns: Int32, pageid: Int32))?
    @subcategories : Array(NamedTuple(title: String, ns: Int32, pageid: Int32))?

    def pages
      @pages ||= @categorymembers.select { |e| e[:ns] == 0 }
    end

    def subcategories
      @subcategories ||= @categorymembers.select { |e| e[:ns] == 14 }
    end
  end
end
