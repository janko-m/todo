class TasksController < InheritedResources::Base
  before_filter :authenticate!
  respond_to :html, :js

  def index
    @search = collection.search(params[:q])
    @tasks = @search.result.decorate
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
    @tasks ||= super.decorate
  end

  def resource
    @task ||= super.decorate
  end

  def permitted_params
    params.permit!
  end
end
