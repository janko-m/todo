module PageHelper
  def page_url(page_name)
    case page_name
    when /home page/ then root_url
    else
      raise "page not recognized: \"#{page_name}\""
    end
  end
end

World(PageHelper)
