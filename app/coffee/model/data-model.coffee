class DataModel
  _list = []

  find: (id) ->
    for val in _list then return val if id is val.id

  findAll: ->
    return _list

  add: (email, name) ->
    id = _list.length + 1
    _list.push
      id: id
      email: email
      name: name
    id

module.exports = DataModel
