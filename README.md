# RailsAdminSelectable

Make any association field easily selectable from index view in rails admin

## Installation

Add this line to your application's Gemfile:

    gem 'rails_admin_selectable'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install rails_admin_selectable

## Usage

Add the selectable action:

    RailsAdmin.config do |config|
      config.actions do
        ......
        select
      end
    end

Make the field you need selectable:

    rails_admin do
      list do
        field :enabled, :select
        ...
      end
      ...
    end

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
