#= require jquery
#= require plugins/editable_in_place

jQuery ->

  $("#tasks").on "add update", (event) ->
    $(event.target).find(".editable_in_place").editableInPlace()
