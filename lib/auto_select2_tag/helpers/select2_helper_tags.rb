module AutoSelect2Tag
  module Select2HelperTags
    def select2_tag(name, option_tags = nil, options = {})
      options[:class] = [options[:class], 'auto-select2 auto-select2-static'].compact.join(' ')
      auto_select2_options = options.delete(:auto_select2)
      if option_tags.include?('<option></option>') || options[:include_blank]
        auto_select2_options ||= {}
        auto_select2_options[:allowClear] ||= true
        auto_select2_options[:placeholder] ||= ''
      end
      if auto_select2_options.present?
        options[:data] = (options[:data] || {}).merge(auto_select2: auto_select2_options)
      end
      select_tag(name, option_tags, options)
    end

    def select2_ajax_tag(name, select2_searcher, value = nil, options={})
      limit = options.delete(:limit)
      original_classes = options.delete(:class)
      original_data = options.delete(:data) || {}
      select2_options = options.delete(:select2_options)
      original_data.merge!('s2-options' => select2_options) if select2_options.present?
      search_method = options.delete(:search_method)
      classes = ['auto-ajax-select2', original_classes].compact.join(' ')
      controller_params = {}
      if select2_searcher.is_a?(Hash)
        # TODO: metaprogramming can help here
        controller_params[:default_class_name] = select2_searcher[:class_name] if select2_searcher[:class_name].present?
        controller_params[:default_text_column] = select2_searcher[:text_column] if select2_searcher[:text_column].present?
        controller_params[:default_id_column] = select2_searcher[:id_column] if select2_searcher[:id_column].present?
        controller_params[:hash_method] = select2_searcher[:hash_method] if select2_searcher[:hash_method].present?
      else
        controller_params[:class_name] = select2_searcher
      end
      if search_method.present?
        controller_params.merge!({ search_method: search_method })
      end
      hidden_field_system_options = {
          class: classes,
          data: original_data.merge(
              { s2_href: select2_autocompletes_path(controller_params),
                # TODO: move s2limit to config or delegate to SearchAdapter
                s2_limit: limit.present? ? limit : 25 }
          )
      }
      hidden_field_options = hidden_field_system_options.merge(options)
      hidden_field_tag(name, value, hidden_field_options)
    end

    def select2_data_tag(name, value = nil, options={})
      original_classes = options.delete(:class)
      classes = ['auto-data-select2', original_classes].compact.join(' ')

      original_data = options.delete(:data) || {}
      select2_options = options.delete(:select2_options)
      original_data.merge!('s2-options' => select2_options) if select2_options.present?
      hidden_field_system_options = {
          class: classes,
          data: original_data.merge(
              {
                  s2_data: options.delete(:s2_data),
                  s2_format_result: options.delete(:s2_format_result),
                  s2_format_selection: options.delete(:s2_format_selection)
              }
          )
      }
      hidden_field_options = hidden_field_system_options.merge(options)
      hidden_field_tag(name, value, hidden_field_options)
    end
  end
end
