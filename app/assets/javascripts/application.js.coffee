#= require jquery
#= require jquery_ujs
#
#= require twitter/bootstrap
#= require bootstrap-datepicker
#
#= require jquery.turbolinks
#= require turbolinks
#
#= require_self
#
#= require_directory .
#
#= require plugins/editable_in_place

$.extend $.fn.datepicker.defaults,
  todayHighlight: true
  autoclose: true
  format: "dd MM yyyy"

jQuery ->

  $(".editable_in_place").editableInPlace()
