module ButtonsHelper
  def submit_button(text, options = {})
    button_tag(text, options.reverse_merge(class: "btn btn-primary"))
  end

  def cancel_button(text, path, options = {})
    link_to text, path, options.reverse_merge(class: "btn")
  end
end
