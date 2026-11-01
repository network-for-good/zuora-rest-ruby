# zuora-rest-ruby
Lite Zuora REST API client

## Requirements

- Ruby 3.2 or newer (`.ruby-version` is 3.4.2)
- ActiveSupport 7.2 or 8.x (declared in the gemspec; the gem uses the inflector,
  `Object#blank?`/`present?`, `Hash#deep_transform_keys` and `Date.tomorrow`)

## Development

```sh
bundle install
bundle exec rspec
```

CI runs the same suite on CircleCI for every push.

## Consumers

donor_management consumes this gem from git `main`, so merging to `main` is the release.
