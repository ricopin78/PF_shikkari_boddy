// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery3
//= require popper
//= require bootstrap-sprockets
//= require rails-ujs
//= require activestorage
//= require turbolinks
//= require dropzone
//= require cocoon
//= require jquery
//= require jquery_ujs
//= require_tree .

$(function () {
  $(document).on("click", '.js-edit-todo-button', function () {
    const todoId = $(this).data('todo-id');
    const todoLabelArea = $('#js-todo-label-' + todoId);
    const todoTextArea = $('#js-textarea-todo-' + todoId);
    const todoButton = $('#js-todo-button-' + todoId);
    const todoError = $('#js-todo-post-error-' + todoId);

    todoLabelArea.hide();
    todoTextArea.show();
    todoButton.show();
    todoError.hide();  });
});

$(function () {
  $(document).on("click", ".todo-update-button", function () {
    const todoId = $(this).data('update-id');
    const textField = $('#js-textarea-todo-' + todoId);
    const title = textField.val();

    $.ajax({
      url: '/todos/' + todoId,
      type: 'PATCH',
      data: {
        todo: {
          title: title
        }
      }
    })
  });
});