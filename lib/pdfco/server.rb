require 'faraday'
require 'base64'

module Pdfco

  class Server

    def self.request(endpoint_url= nil, params= {}, method_verb= :post)
      if endpoint_url == "/file/upload" && params[:file]
        params = { file: Faraday::UploadIO.new(params[:file], '*/*') }
      elsif endpoint_url == "/file/upload/base64" && params[:file]
        base64_bytes = Base64.encode64(File.read(params[:file]))
        params = { file: "data:*/*;base64," + base64_bytes }
      end

      services(endpoint_url, params, method_verb)
    end

    private

    def self.services(path, args, method=:get)
      HTTPService.make_request(path, args, method)
    end
  end

end