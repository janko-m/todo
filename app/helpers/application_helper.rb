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

  def editable(content, options = {})
    content_tag :span, content, options.merge_class!("editable")
  end

  def icon(name, options = {})
    content_tag :i, "", options.merge_class!("icon-#{name}")
  end
end
