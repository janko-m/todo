module TasksHelper
  def priorities
    {
      1 => content_tag(:span, "Low",    class: "label label-info"),
      2 => content_tag(:span, "Medium", class: "label label-warning"),
      3 => content_tag(:span, "High",   class: "label label-important"),
    }
  end
end
