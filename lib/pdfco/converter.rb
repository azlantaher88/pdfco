
module Pdfco

  class Converter

    def initialize(attributes)
      puts "initializer"
    end

    def self.make_api_call(method_name= nil, method_verb= :get, params= {})
      request_url = map_method_name_to_url(method_name, params)
      response = services(request_url, params, method_verb)
      response
    end

    private

    def self.services(path, args, method=:get)
      HTTPService.make_request(path, args, method)
    end

    def self.map_method_name_to_url(method_name, params)
      case method_name
      when "pdf_to_csv"
        "/pdf/convert/to/csv"
      when "pdf_to_json"
        "/pdf/convert/to/json"
      when "pdf_to_text"
        "/pdf/convert/to/text"
      when "pdf_to_xls", "pdf_to_xlsx"
        "/pdf/convert/to/xls"
      when "pdf_to_xml"
        "/pdf/convert/to/xml"
      when "pdf_to_html"
        "/pdf/convert/to/html"
      when "pdf_to_jpg"
        "/pdf/convert/to/jpg"
      when "pdf_to_png"
        "/pdf/convert/to/png"
      when "pdf_to_tiff"
        "/pdf/convert/to/tiff"
      when "csv_to_pdf"
        "/pdf/convert/from/csv"
      when "document_to_pdf"
        "/pdf/convert/from/doc"
      when "url_to_pdf", "invoice_template_1_to_pdf", "invoice_template_2_to_pdf", "invoice_template_3_to_pdf"
        "/pdf/convert/from/url"
      when "html_to_pdf"
        "/pdf/convert/from/html"
      when "inline_html_template_to_pdf"
        "/pdf/convert/from/html"
      when "image_to_pdf"
        "/pdf/convert/from/image"
      when "xls_csv_to_pdf"
        "/xls/convert/to/pdf"
      when "xls_xlsx_to_csv"
        "/xls/convert/to/csv"
      when "xls_xlsx_to_json"
        "/xls/convert/to/json"
      when "xls_xlsx_to_html"
        "/xls/convert/to/html"
      when "xls_xlsx_to_txt"
        "/xls/convert/to/txt"
      when "xls_xlsx_to_xml"
        "/xls/convert/to/xml"
      else
        ""
      end
    end
  end
end