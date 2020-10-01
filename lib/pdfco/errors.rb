module Pdfco

  class PdfcoError < StandardError; end

  # Pdfco respondes with status of 200 even if there is an exception (most of the time)
  class APIError < ::Pdfco::PdfcoError

    attr_accessor :verbose_message, :status, :error_body

    # Create a new API Error
    # @return the newly created APIError
    def initialize(status, body)
      @error_body = body
      @status = status

      unless @error_body.nil? || @error_body.empty?
        @verbose_message = error_body['message']
      end

      super(@verbose_message)

    end

    # Just to enable user to call this method on response object to know if any error has occured
    # Free user form the Hastle of checking the class of object on every request.
    def error?
      true
    end
  end

  # A standard Error calss for Raising error if [cid, shared_secret, api_key] are not provided.
  class AuthCredentialsError < ::Pdfco::PdfcoError; end

end