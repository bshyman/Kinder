function createMessageChannel() {
  App.messages = App.cable.subscriptions.create({
        channel: 'MessagesChannel', chat_id: parseInt($("#message_chat_id").val())
        },
        {
        received: function(data) {
          $("#messages").removeClass('hidden')
          return $('#messages').append(this.renderMessage(data));
        },
        renderMessage: function(data) {
          return "<p class='message-line'>" + "<img class='message-pic'" + "src='" + data.user + "'" +"alt='photo'" + "width=30" + "height=30" + ">" + data.message + "</p>";
        },
      });

  return App.messages;
}
