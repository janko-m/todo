module ButtonsHelper
  def submit_button(text, options = {})
    abstract_button(:button, text, options.reverse_merge(class: "btn-primary"))
  end

  def cancel_button(text, path, options = {})
    abstract_button(:a, text, path, options)
  end

  def abstract_button(tag_name, *args)
    options = args.extract_options!
    options[:class] = ["btn", options[:class]].compact.join(" ")
    args << options

    case tag_name
    when :a
      link_to(*args)
    when :button
      button_tag(*args)
    end
  end
end
