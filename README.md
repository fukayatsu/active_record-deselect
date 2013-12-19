# ActiveRecordDeselect

Adds deselect logic to ActiveRecord

## Installation

Add this line to your application's Gemfile:

    gem 'active_record-deselect'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install active_record-deselect

## Usage

```ruby
Post.column_names
# => ["id", "name", "body"]

Post.select(:id, :name, :body).deselect(:id, :name).select_values
# => [:body]

Post.all.deselect(:id).select_values
# => [:name, :body]

Post.deselect(:id).select_values
# => [:name, :body]
```

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
