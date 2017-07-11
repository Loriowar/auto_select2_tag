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

    def select2_ajax_tag(name, adapter, value = nil, options={})
      auto_select2_options = options.delete(:auto_select2) || {}
      auto_select2_options[:href] = select2_autocompletes_path(adapter: adapter.type)
      auto_select2_options[:data] = adapter.init(value, auto_select2_options[:extra] || {})

      options[:data] = (options[:data] || {}).merge(auto_select2: auto_select2_options)
      options[:class] = ['auto-select2', 'auto-select2-ajax', options[:class]].compact.join(' ')

      select_tag(name, '', options)
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
