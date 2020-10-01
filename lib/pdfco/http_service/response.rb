module Pdfco

  module HTTPService

    class Response

      attr_reader :status, :body, :headers

      # Creates a new Response object, which standardizes the response received From Pdf.co.
      def initialize(status, body, headers)
        @status = status
        @body = JSON.parse(body) rescue ''
        @headers = headers
      end

    end

  end

end