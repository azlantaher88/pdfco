require 'faraday'
require 'base64'

module Pdfco

  class PdfFile

    def initialize(attributes)
      puts "initializer"
    end

    def self.make_api_call(method_name= nil, method_verb= :get, params= {})
      request_url = map_method_name_to_url(method_name, params)
      if method_name == "upload_small_file" && params[:file]
        params = { file: Faraday::UploadIO.new(params[:file], '*/*') }
      elsif method_name == "upload_file_as_base64" && params[:file]
        base64_bytes = Base64.encode64(File.read(params[:file]))
        params = { file: "data:*/*;base64," + base64_bytes }
      end
      response = services(request_url, params, method_verb)
      response
    end

    private

    def self.services(path, args, method=:get)
      HTTPService.make_request(path, args, method)
    end

    def self.map_method_name_to_url(method_name, params)
      case method_name
      when "get_presigned_url"
        "/file/upload/get-presigned-url"
      when "upload_file_from_url"
        "/file/upload/url?url=#{params[:url]}"
      when "upload_file_from_url_post"
        "/file/upload/url"
      when "delete_file"
        "/file/delete"
      when "file_hash"
        "/file/hash"
      when "upload_small_file"
        "/file/upload"
      when "upload_file_as_base64"
        "/file/upload/base64"
      when "split"
        "/pdf/split"
      when "merge"
        "/pdf/merge"
      when "delete_pages"
        "/pdf/edit/delete-pages"
      when "optimize"
        "/pdf/optimize"
      when "generate_barcode"
        "/barcode/generate"
      when "barcode_reader"
        "/barcode/read/from/url"
      when "email_decode"
        "/email/decode"
      when "extract_email_attachment"
        "/email/extract-attachments"
      when "check_background_job"
        "/job/check"
      else
        ""
      end
    end
  end
end