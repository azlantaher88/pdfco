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

    def self.by_name(name, args={})
      args.merge!({name: name})
      attributes = services('/file/upload/get-presigned-url', args)
      new(attributes.body)
    end

    private

    def self.services(path, args, method=:get)
      HTTPService.make_request(path, args, method)
    end
  end
end