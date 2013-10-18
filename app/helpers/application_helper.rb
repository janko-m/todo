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
end
