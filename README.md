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

agent = DockerShellHelper::Rancher.new

agent.rancher_scheme = ENV['RANCHER_SCHEME']
agent.rancher_host = ENV['RANCHER_HOST']
agent.rancher_port = ENV['RANCHER_PORT']
agent.access_key = ENV['RANCHER_ACCESS_KEY']
agent.secret_key = ENV['RANCHER_SECRET_KEY']
agent.container_name = ENV['CONTAINER_NAME']

return agent.get_token
```

###  More

Please take one shot at [NSYSU WARGAME](https://wargame.cse.nsysu.edu.tw/).
