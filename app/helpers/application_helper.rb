module ApplicationHelper
  # React
  # based on https://github.com/reactjs/react-rails/blob/master/lib/react/rails/view_helper.rb
  def react_element(integration_name, payload = {}, options = {}, &block)
    html_options = { data: {} }
    payload = camelize_props_key(payload)
    html_options[:data].tap do |data|
      data[:integration_name] = integration_name
      data[:options] = options.except(:tag)
      data[:payload] = (payload.is_a?(String) ? payload : payload.to_json)
      data[:react_element] = true
    end
    html_tag = options[:tag] || :div

    content_tag(html_tag, '', html_options, &block)
  end

  def react_component(name, props = {}, options = {})
    react_element('react-component', props, options.merge(name: name))
  end

  private

  def camelize_props_key(props)
    return props unless props.is_a?(Hash)
    props.inject({}) do |h, (k,v)|
      h[k.to_s.camelize(:lower)] = v.is_a?(Hash) ? camelize_props_key(v) : v; h
    end
  end
end
