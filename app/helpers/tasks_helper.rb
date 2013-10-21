module TasksHelper
  def priorities(options = {})
    {
      1 => content_tag(:span, "Low",    options.merge_class("label label-info")),
      2 => content_tag(:span, "Medium", options.merge_class("label label-warning")),
      3 => content_tag(:span, "High",   options.merge_class("label label-important")),
    }
  end
end
