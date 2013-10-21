module DomHelper
  def navbar
    find(".navbar")
  end

  def tasks
    all("tbody tr")
  end
end

World(DomHelper)
