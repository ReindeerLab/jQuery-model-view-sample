class DataModel
  _list = []
  _seq = 1

  find: (id) ->
    for val in _list then return val if id is val.id

  findAll: ->
    return _list

  add: (email, name) ->
    _list.push
      id: _seq
      email: email
      name: name
    _seq++

  del: (id) ->
    _list = _list.filter (val) ->
      id isnt val.id

  save: (id, email, name) ->
    return

module.exports = DataModel
