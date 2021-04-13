# mediawiki

Wrapper for the [MediaWiki API](https://www.mediawiki.org/wiki/API:Main_page)

**Note:** The MediaWiki API is very extensive, and the full scope is beyond what I have free time for. Contributions are very welcome.

## Installation

1. Add the dependency to your `shard.yml`:

   ```yaml
   dependencies:
     mediawiki:
       github: HCLarsen/mediawiki
   ```

2. Run `shards install`

## Usage

```crystal
require "mediawiki"

client = Wikipedia::Client.new("en.wikipedia.org")

page = client.get_page("Cementite")
page.title  #=> "Cementite"
```

```crystal
category = client.get_category("Iron compounds")

category.pages.size #=> 105
```

## Development

1. Add classes and methods for other API endpoints.

## Contributing

1. Fork it (<https://github.com/HCLarsen/mediawiki/fork>)
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request

## Contributors

- [Chris Larsen](https://github.com/HCLarsen) - creator and maintainer
