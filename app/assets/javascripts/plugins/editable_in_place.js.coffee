#= require jquery
#= require templates/in_place_editor

$.fn.editableInPlace = ->

  @.each (_, element) =>
    editor = new InPlaceEditor($(element))
    $(element).on "click", =>
      editor.activate() unless editor.isActive()

class InPlaceEditor

  constructor: (@element) ->
    @options = @element.data()

  activate: =>
    switch @options.type
      when "string"            then new StringForm(@element).activate()
      when "date"              then new DateForm(@element).activate()
      when "boolean", "select" then new SelectForm(@element).activate()

  isActive: =>
    @element.closest("td").find(".in_place_editor").length != 0

class AbstractForm

  constructor: (@element) ->
    @options = @element.data()

  activate: =>
    @initialize()

  abort: =>
    @hide()

  show: =>
    @text = @element.html()
    @element.html(@form)

  hide: =>
    @element.html(@text)

  initialize: =>
    @form = $(JST["templates/in_place_editor"](@options))
      .on "submit", (event) => event.preventDefault()

  submit: =>
    $.ajax @options.url,
      type: "PUT"
      data: @form.serializeArray()
      dataType: "script"

class StringForm extends AbstractForm

  activate: =>
    super
    @show()
    @focus()

  initialize: =>
    super
    @form.find("[type='text']")
      .on "change", =>
        @submit()
      .on "blur", (event) =>
        @abort() if $(event.target).val() == @options.value
      .on "keyup", (event) =>
        switch event.keyCode
          when 27    then @abort()  # escape
          when 13, 9 then @submit() # return, tab

  focus: =>
    @form.find("[type='text']").focus()

class DateForm extends AbstractForm

  activate: =>
    super
    @show()
    @focus()

  initialize: =>
    super
    @form.find("[type='text']")
      .on "hide", =>
        @submit()
      .on "keyup", (event) =>
        switch event.keyCode
          when 27 then @abort() # escape

  focus: =>
    @form.find("[type='text']").focus()

class SelectForm extends AbstractForm

  activate: ->
    super
    @submit()
