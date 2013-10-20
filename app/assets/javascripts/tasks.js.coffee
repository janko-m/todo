jQuery ->

  $("#tasks").on "click", "input[type='checkbox']", ->
    form = $(@).closest("tr").find("form")
    inputData = {}
    inputData[$(@).attr("name")] = $(@)[0].checked

    $.ajax form.attr("action"),
      type: "PUT"
      data: inputData
      dataType: "script"

  $("#task_due_date").datepicker
    todayHighlight: true
    autoclose: true
    format: "dd/mm/yyyy"
