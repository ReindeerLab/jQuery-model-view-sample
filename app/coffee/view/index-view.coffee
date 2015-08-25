DataModel = require '../model/data-model.coffee'

module.exports = ->
  model = new DataModel()

  addRow = (id, email, name) ->
    $('table tbody').append "<tr data-list-id=\"#{id}\">
      <td>#{id}</td>
      <td>#{email}</td>
      <td>#{name}</td>
      <td>
        <button type=\"button\" class=\"btn btn-danger del\" data-list-id=\"#{id}\">
          <span class=\"glyphicon glyphicon-trash\" aria-hidden=\"true\"></span>
        </button>
      </td>
      </tr>"

    $('#email').val ''
    $('#name').val ''

    $('.del').off().on 'click', ->
      delRow $(@).attr 'data-list-id'

  delRow = (id) ->
    model.del id
    $("tr[data-list-id='#{id}']").remove()

  $('#add').on 'click', ->
    email = $('#email').val()
    name = $('#name').val()
    id = model.add email, name
    addRow id, email, name
    false

  return
