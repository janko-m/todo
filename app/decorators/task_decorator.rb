class TaskDecorator < Draper::Decorator
  delegate_all

  def complete(f)
    f.input_field(:complete)
  end

  def content(f)
    content = object.content? ? h.editable(object.content) : blank
    content + f.text_field(:content)
  end

  def due_date(f)
    content = object.due_date? ? h.editable(h.localize(object.due_date)) : blank
    content + f.text_field(:due_date, value: (h.localize(object.due_date) if object.due_date?), data: {provide: "datepicker"})
  end

  def priority(f)
    h.content_tag :div, class: "dropdown" do
      html = {data: {toggle: "dropdown"}, class: "dropdown-toggle"}
      content = object.priority? ? h.priorities(html)[object.priority] : blank(html)
      content + f.collection_radio_buttons(:priority, h.priorities.to_a, :first, :last,
        collection_wrapper_tag: :ul, collection_wrapper_class: "dropdown-menu",
        item_wrapper_tag: :li) do |b|
          id = "task_priority_#{object.id}_#{h.cycle(*h.priorities.keys)}"
          b.radio_button(id: id) + b.label(for: id)
        end
    end
  end

  private

  def blank(options = {})
    h.editable("Assign", options.merge_class!("blank"))
  end
end
