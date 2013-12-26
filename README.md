# ActiveRecord::Deselect

Adds deselect logic to ActiveRecord.

## Installation

Add this line to your application's Gemfile:

    gem 'active_record-deselect'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install active_record-deselect

## Usage

```ruby
4.0.2 @ 2.0.0 (main)>Post
#=> class Post < ActiveRecord::Base {
              :id => :integer,
            :name => :string,
            :body => :text,
         :user_id => :integer,
    :published_at => :datetime,
      :created_at => :datetime,
      :updated_at => :datetime
}

4.0.2 @ 2.0.0 (main)>Post.deselect(:body).to_sql
#=> "SELECT id, name, user_id, published_at, created_at, updated_at FROM \"posts\""

4.0.2 @ 2.0.0 (main)>Post.select(:id, :name, :body, :user_id).deselect(:body, "user_id").to_sql
#=> "SELECT id, name FROM \"posts\""

4.0.2 @ 2.0.0 (main)>Post.select('posts.id', 'posts.name').deselect(:name).to_sql
#=> "SELECT posts.id FROM \"posts\""

4.0.2 @ 2.0.0 (main)>Post.select(:id).deselect(:id).to_sql
#=> "SELECT \"posts\".* FROM \"posts\""
```

### deselect!

```ruby
posts = Post.select(:id, :name)
posts.deselect!(:name)
posts.to_sql
#=> "SELECT id FROM \"posts\""
```

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
