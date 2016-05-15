module DockerShellHelper
  class Rancher
    attr_accessor :"rancher_scheme", :"rancher_host", :"rancher_port", :"container_name", :"rancher_command"
    attr_writer :"access_key", :"secret_key", :timeout

    def initialize
      @timeout = 10
      @rancher_port = "80"
      @rancher_scheme = "http"
      @rancher_command = "/bin/bash"
    end

    def get_token
      if @rancher_host && @access_key && @secret_key && @container_name
        @id = get_id @container_name
        data = {
          "attachStdin" => "true",
          "attachStdout" => "true",
          "command" => ["/bin/sh", "-c", "TERM=xterm-256color; export TERM; [ -x /bin/bash ] && ([ -x /usr/bin/script ] && /usr/bin/script -q -c \"#{@rancher_command}\" /dev/null || exec #{@rancher_command}) || exec /bin/sh"],
          "tty" => "true"
        }

        header = {
          "Accept" => "application/json",
          "Content-Type" => "application/json"
        }

        res = RestClient::Request.execute method: :post , url: "#{@rancher_scheme}://#{@rancher_host}:#{@rancher_port}/v1/containers/#{@id}/?action=execute", user: @access_key, password: @secret_key, payload: data, headers: header, timeout: @timeout

        token = (JSON.parse(res))["token"]
        
        return token
      end
    end

    private

    def get_id(name)
      res = RestClient::Request.execute method: :get , url: "#{@rancher_scheme}://#{@rancher_host}:#{@rancher_port}/v1/containers/?name=#{name}", user: @access_key, password: @secret_key, timeout: @timeout
      id = (JSON.parse(res))["data"][0]["id"]
      return id
    end
  end
end