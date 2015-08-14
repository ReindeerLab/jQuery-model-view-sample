function DataModel() {
  this.list = [];
}

DataModel.prototype.add = function(email, name) {
  var id;
  this.list.push ({email: email, name: name});
  id =  this.list.length;
  this.list[id - 1].id = id;
  return id;
};

DataModel.prototype.find = function(id) {
  var i, len, data;
  len = this.list.length;
  for (i = 0; i < len; i++) {
    data = this.list[i];
    if (data.id === id) {
      return data;
    }
  }
};

DataModel.prototype.findAll = function() {
  return this.list;
};
