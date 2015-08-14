$(function() {

  var model, addRow;

  model = new DataModel();

  addRow = function(id, email, name) {
    $('table tbody').append(
      '<tr>'
      + '<td>' + id + '</td>'
      + '<td>' + email + '</td>'
      + '<td>' + name + '</td>'
      + '</tr>'
    );
  };

  $('#add').on('click', function() {
    var id, email, name;
    email = $('#email').val();
    name = $('#name').val();
    id = model.add(email, name);
    addRow(id, email, name);
  });
});
