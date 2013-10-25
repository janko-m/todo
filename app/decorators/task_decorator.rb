class TaskDecorator < Draper::Decorator
  delegate_all

  def complete
    h.editable_in_place h.check_box_tag(nil, nil, object.complete),
      object: object, column: :complete
  end

  def content
    h.editable_in_place object.content,
      object: object, column: :content
  end

  def due_date
    h.editable_in_place object.due_date && h.localize(object.due_date),
      object: object, column: :due_date,
      input_value: (object.due_date && h.localize(object.due_date)),
      input_html: {:"data-provide" => "datepicker"}
  end

  def priority
    h.editable_in_place h.priorities[object.priority],
      object: object, column: :priority,
      type: :select, collection: h.priorities.keys
  end
end
