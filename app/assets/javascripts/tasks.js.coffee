jQuery ->

  new InlineEditor("#tasks").enable()
  new TaskUpdater("#tasks").listen()

class TaskUpdater

  constructor: (tasks) ->
    @tasks = $(tasks)

  listen: =>
    @tasks.on "change", "input,textarea,select", (event) =>
      input = $(event.target)
      url = input.closest("tr").find("form").attr("action")

      data = {}
      switch input.attr("type")
        when "checkbox" then data[input.attr("name")] = input[0].checked
        else                 data[input.attr("name")] = input.val()

      @updateTask(url, data)

  updateTask: (url, data) =>
    $.ajax url,
      type: "PUT"
      data: data
      dataType: "script"
