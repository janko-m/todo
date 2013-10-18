module ApplicationHelper
  def title(value = nil)
    if value
      @title = value
    else
      @title
    end
  end
end
