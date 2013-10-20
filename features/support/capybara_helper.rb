module CapybaraHelper
  def refresh
    visit current_path
  end
end

World(CapybaraHelper)
