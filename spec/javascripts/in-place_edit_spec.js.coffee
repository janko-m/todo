#= require in-place_edit
#= require datepicker

describe "in-place_edit", ->

  beforeEach ->
    loadFixtures("tasks")

    @scope = $("#tasks")

    @textField    = @scope.find("[data-type='string']")
    @dateField    = @scope.find("[data-type='date']")
    @selectField  = @scope.find("[data-type='select']")

    spyOn($, "ajax")

  it "attaches the editor on click event", ->
    @textField.click()
    expect(@textField).toContain(".in-place_editor")

  describe "InPlaceEditor", ->

    it "doesn't activate again once it's active", ->
      @textField.click()
      editor = @textField.find(".in-place_editor")
      @textField.click()
      expect(editor).toExist()

  describe "AbstractForm", ->

    beforeEach ->
      @form = new AbstractForm(@textField)
      @form.activate()
      @form.show()

    it "prevents submit on the form", ->
      spyOnEvent(".in-place_editor", "submit")
      $(".in-place_editor").submit()
      expect("submit").toHaveBeenPreventedOn(".in-place_editor")

  describe "StringForm", ->

    beforeEach ->
      @form = new StringForm(@textField)
      @form.activate()

    it "shows the form on activation", ->
      expect(@textField).toContain(".in-place_editor")

    it "focuses the form on activation", ->
      expect(@textField.find("input[type='text']")).toBeFocused()

    it "submits on change", ->
      @textField.find("input[type='text']").val("Watch something else").change()
      expect($.ajax).toHaveBeenCalled()
      expect($.ajax.mostRecentCall.args[1].data[0].value).toMatch(/Watch something else/)

    it "submits on enter", ->
      @textField.find("input[type='text']").blur("Watch something else").trigger($.Event("keyup", keyCode: 13))
      expect($.ajax).toHaveBeenCalled()
      expect(@textField).not.toContain(".in-line_editor")

    it "cancels on escape", ->
      @textField.find("input[type='text']").val("Watch something else").trigger($.Event("keyup", keyCode: 27))
      expect(@textField).not.toContain(".in-line_editor")
      expect($.ajax).not.toHaveBeenCalled()

    it "cancels on blur when nothing has changed", ->
      @textField.find("input[type='text']").blur()
      expect(@textField).not.toContain(".in-line_editor")
      expect($.ajax).not.toHaveBeenCalled()

  describe "DateForm", ->

    beforeEach ->
      @form = new StringForm(@dateField)
      @form.activate()

    afterEach ->
      $(".datepicker").remove()

    it "shows the form on activation", ->
      expect(@dateField).toContain(".in-place_editor")

    it "focuses the form on activation", ->
      expect(@dateField.find("input[type='text']")).toBeFocused()
      expect($(".datepicker")).toExist()

    it "submits on chosen date", ->
      $(".datepicker").find(".day").click()
      expect($.ajax).toHaveBeenCalled()
      expect($.ajax.mostRecentCall.args[1].data[0].value).toMatch(/\d+/)

    it "cancels on escape", ->
      @dateField.find("input[type='text']").trigger($.Event("keyup", keyCode: 27))
      expect(@dateField).not.toContain(".in-line_editor")
      expect($.ajax).not.toHaveBeenCalled()

  describe "SelectForm", ->

    beforeEach ->
      @form = new SelectForm(@selectField)

    it "submits on activation", ->
      @form.activate()
      expect($.ajax).toHaveBeenCalled()

    it "traverses through collection on activation", ->
      @selectField.data("value", 2)
      @form.activate()
      expect($.ajax.mostRecentCall.args[1].data[0].value).toEqual("3")

      @selectField.data("value", 3)
      @form.activate()
      expect($.ajax.mostRecentCall.args[1].data[0].value).toEqual("1")

    it "assigns the first element of the collection when blank", ->
      @selectField.data("value", null)
      @form.activate()
      expect($.ajax.mostRecentCall.args[1].data[0].value).toEqual("1")
