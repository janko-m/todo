module ApplicationHelper
  def title(value = nil)
    if value
      @title = value
    else
      @title
    end
  end

  def controls(&block)
    content_tag :div, class: "control-group" do
      content_tag :div, class: "controls", &block
    end
  end

  def editable_in_place(text, options = {})
    object       = options[:object]
    object_name  = ActiveModel::Naming.param_key(object.class)
    column_name  = options[:column].to_s
    column_type  = object.class.column_types[column_name].type
    column_value = object.send(column_name)

    data_options = {
      url:   polymorphic_path(object),
      name:  "#{object_name}[#{column_name}]",
      type:  options[:type] || column_type,
      value: options[:input_value] || column_value,
      attrs: (options[:input_html] || {}).map { |k, v| "#{k}=#{v}" }.join(" "),
    }

    case data_options[:type]
    when :select
      data_options[:collection] = options.fetch(:collection).to_json
    when :boolean
      data_options[:value] = {true => 1, false => 0}[data_options[:value]]
      data_options[:collection] = [0, 1].to_json
    end

    if text.present?
      content_tag :span, text, class: "editable_in_place", data: data_options
    else
      content_tag :span, "Assign", class: "editable_in_place blank", data: data_options
    end
  end
end
