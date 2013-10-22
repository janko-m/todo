class TasksController < InheritedResources::Base
  before_filter :authenticate!
  respond_to :html, :js, :json

  def index
    @search = collection.search(params[:q])
    if params[:q]
      @tasks = @search.result
      @tasks = @tasks.decorate if will_render_template?
    end
    @task = Task.new
    super
  end

  def create
    super { tasks_path }
  end

  def update
    super { tasks_path }
  end

  private

  def begin_of_association_chain
    current_user
  end

  def collection
    @tasks ||= begin
      tasks = super.ascending
      tasks = tasks.decorate if will_render_template?
      tasks
    end
  end

  def resource
    @task ||= begin
      task = super
      task = task.decorate if will_render_template?
      task
    end
  end

  def permitted_params
    params.permit!
  end

  def will_render_template?
    params[:format].in? [nil, "html", "js"]
  end
end
