class TaskDecorator < Draper::Decorator
  delegate_all

  def due_date
    object.due_date.strftime("%d %B %Y") if object.due_date
  end

  def priority
    h.priorities[object.priority]
  end
end
