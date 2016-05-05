require "docker-shell-helper/version"
require 'rest-client'

module DockerShellHelper
  class Rancher
    def self.get_token(client)
      begin
        JSON.parse(client)
      rescue JSON::ParserError => e
        return "Invalid JSON format"
      end

      params = [
        "RANCHER_ACCESS_KEY",
        "RANCHER_SECRET_KEY"
      ]

      # check json data is enough or not
      params.each do |p|
        unless (JSON.parse(client)).has_key?(p)
          return "can not find #{p}"
        end
      end

      clientJSON = JSON.parse(client)
      ra_key = clientJSON["RANCHER_ACCESS_KEY"]
      rs_key = clientJSON["RANCHER_SECRET_KEY"]

      data = {
        "attachStdin" => "true",
        "attachStdout" => "true",
        "command" => "[\"/bin/sh\"]",
        "tty" => "true"
      }

      header = {
        "Accept" => "application/json",
        "Content-Type" => "application/json"
      }

      res = RestClient::Request.execute method: :post , url: 'http://wargame.cse.nsysu.edu.tw:83/v1/containers/1i259/?action=execute', user: ra_key, password: rs_key, payload: data, headers: header

      token = (JSON.parse(res))["token"]
      
      return token
    end

    def self.Test
      puts "Test"
    end
  end
end
