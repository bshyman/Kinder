$(document).ready(function($) {
  App.messages = App.cable.subscriptions.create({
        channel: 'MessagesChannel', chat_id: parseInt($("#message_chat_id").val())
        }, {
          received: function(data) {
            $("#messages").removeClass('hidden')
            return $('#messages').append(this.renderMessage(data));
          },

          renderMessage: function(data) {
            return "<p> <b>" + data.user + ": </b>" + data.message + "</p>";
          },
      });

  $(document).on("keypress", function(e) {
    if (e.keyCode === 13) {
      //what to put here!?
    }
  });
});
