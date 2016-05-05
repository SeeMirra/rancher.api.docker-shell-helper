# DockerShellHelper

A simple Ruby gem library for helping you to get docker shell through Rancher API easier.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'docker-shell-helper'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install docker-shell-helper

## Usage

```ruby
require 'docker-shell-helper'

# Can user file reader

client = {
  :RANCHER_ACCESS_KEY => ENV['RANCHER_ACCESS_KEY']
  :RANCHER_SECRET_KEY => ENV['RANCHER_SECRET_KEY']
}

return DockerShellHelper::Rancher.get_token client.to_json
```

###  More

Please take one shot at [NSYSU WARGAME](https://wargame.cse.nsysu.edu.tw/).
