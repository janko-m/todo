class Api::TasksController < Api::BaseController
  inherit_resources

  before_action :authenticate!

  private

  def begin_of_association_chain
    current_user
  end

  def collection
    @tasks ||= super.ascending
  end

  def permitted_params
    params.permit(task: [:complete, :content, :due_date, :priority])
  end
end
