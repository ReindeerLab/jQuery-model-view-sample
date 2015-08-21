DataModel = require '../model/data-model.coffee'

module.exports = ->
  model = new DataModel()

  addRow = (id, email, name) ->
    $('table tbody').append "<tr><td>#{id}</td><td>#{email}</td><td>#{name}</td></tr>"

  $('#add').on 'click', ->
    email = $('#email').val()
    name = $('#name').val()
    id = model.add email, name
    addRow id, email, name
    false

  return
