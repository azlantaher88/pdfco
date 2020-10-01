require 'faraday'
require 'json'

module Pdfco

  class PdfFile

    attr_reader :name, :url, :presigned_url

    def initialize(attributes)
      @url = attributes["url"]
      @presigned_url = attributes["presignedUrl"]
      @name = attributes["name"]
    end

    def self.get_presigned_url(name, args={})
      args.merge!({name: name})
      response = services('/file/upload/get-presigned-url', args)
      return new(response) unless response.error?
      response
    end

    def self.temp_file_from_url(name, source_url, args={})
      args.merge!({
        url: source_url,
        name: name
      })
      response = services('/file/upload/url', args)
      return new(response) unless response.error?
      response
    end

    private

    def self.services(path, args, method=:get)
      HTTPService.make_request(path, args, method)
    end
  end
end