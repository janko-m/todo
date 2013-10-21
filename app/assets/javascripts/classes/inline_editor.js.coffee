class @InlineEditor

  constructor: (element) ->
    @element = $(element)

  enable: =>
    @element.on "click", ".editable", (event) =>
      text = $(event.target).closest(".editable")
      input = text.siblings("input").first()

      switch input.attr("type")
        when "text" then @_showTextField(text, input)

    @element.on "blur", "input[type='text'],textarea", (event) =>
      input = $(event.target)
      text = input.siblings(".editable").first()

      @_removeTextField(text, input)

  _showTextField: (text, input) =>
    text.hide()
    input.show()
    input.focus()

  _removeTextField: (text, input) =>
    input.hide()
    text.show()
