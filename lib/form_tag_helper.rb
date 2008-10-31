module ActionView
  module Helpers
    module FormTagHelper
      def secure_form_tag(url_for_options = {}, options = {}, *parameters_for_url, &block)
        html_options = secure_html_options_for_form(url_for_options, options, *parameters_for_url)
        if block_given?
          form_tag_in_block(html_options, &block)
        else
          form_tag_html(html_options)
        end
      end
      
    private
    
      def secure_html_options_for_form(url_for_options, options, *parameters_for_url)
        unless SslRequirement.disable_ssl_check?
          # If url_for_options is a string use it as a controller. This will make url_for add the host and protocol
          # to the string. If you know a better way to do this, please let me know.
          if url_for_options.class == String
            url_for_options = { :controller => url_for_options }
          end
          
          # need to show the full path in order to change protocols
          url_for_options.merge!({
            :only_path => false,
            :protocol => 'https'
          })
        end
        
        returning options.stringify_keys do |html_options|
          html_options["enctype"] = "multipart/form-data" if html_options.delete("multipart")
          html_options["action"]  = url_for(url_for_options, *parameters_for_url)
        end
      end
    end
  end
end
