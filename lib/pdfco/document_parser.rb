
module Pdfco

  class DocumentParser

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
      when "templates"
        "/pdf/documentparser/templates"
      when "template"
        "/pdf/documentparser/templates/#{params[:template_id]}"
      when "results"
        "/pdf/documentparser/results?templateId=#{params[:template_id]}"
      when "results_post"
        "/pdf/documentparser/results"
      when "output_as_json", "output_as_csv", "custom_template"
        "/pdf/documentparser"
      when "delete_results"
        "/pdf/documentparser/results/#{params["results_id"]}"
      when "pdf_info"
        "/pdf/info"
      when "pdf_forms_info"
        "/pdf/info/fields"
      when "add_text_and_images_to_pdf_simplified", "add_text_and_images_to_pdf", "pdf_fill_forms_simplified", "pdf_fill_forms", "create_fillable_pdf_form"
        "/pdf/edit/add"
      when "pdf_find"
        "/pdf/find"
      when "replace_text_multiple", "replace_text_single"
        "/pdf/edit/replace-text"
      when "replace_text_with_image"
        "/pdf/edit/replace-text-with-image"
      when "delete_text_multiple", "delete_text_single"
        "/pdf/edit/delete-text"
      when "make_searchable_pdf"
        "/pdf/makesearchable"
      else
        ""
      end
    end

  end
end