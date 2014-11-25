# AutoSelect2Tag

Provide tag-helper methods for create Select2 elements by the same way as any other view elements.

[![Gem Version](https://badge.fury.io/rb/auto_select2_tag.png)](http://badge.fury.io/rb/auto_select2_tag)

## Installation

Firstly install [AutoSelect2](https://github.com/Loriowar/auto_select2#installation) with
dependency. Then add this line to your application's Gemfile:

    gem 'auto_select2_tag'

And execute:

    $ bundle

## Usage

Gem provide only two helper methods for initialize select2 elements:

* select2_tag
* select2_ajax_tag

details about realization you can find on
[AutoSelect2](https://github.com/Loriowar/auto_select2#installation) page.

### select2_tag

    select2_tag(name, option_tags = nil, options = {})

Has same behavior as common
[select_tag](http://apidock.com/rails/ActionView/Helpers/FormTagHelper/select_tag). In addition
you can specify `:select2_options` in options. This parameter allow to set select2
[constructor options](http://ivaynberg.github.io/select2/).

#### Example of usage select2_tag

    = select2_tag :select2_name,
                   my_options_for_select2(my_init_value),
                   placeholder: 'Fill me!',
                   include_blank: true,
                   select2_options: {width: 'auto'}

### select2_ajax_tag

    select2_ajax_tag(name, select2_searcher, value = nil, options = {})

All allowed options for this helper can be found on
[AutoSelect2](https://github.com/Loriowar/auto_select2#installation) page. look at example
below; this is an easy way to understand helper parameters.

#### Example of usage select2_ajax_tag

    = select2_ajax_tag :my_select2_name,
                       :my_search_adapter_name,
                       my_init_value_id,
                       placeholder: 'Fill me now!',
                       search_method: :unusual_case,
                       class: 'my-select2-input',
                       select2_options: {additional_ajax_data: {selector: '.additional-elements'}}

## Contributing

1. Fork it ( http://github.com/Loriowar/auto_select2_tag/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
