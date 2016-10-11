App.messages = App.cable.subscriptions.create("MessagesChannel", {
  received: function(data){
    $("#messages").removeClass("hidden");
    return $("#messages").append(this.renderMessage(data));
  },

  renderMessage: function(data){
    return "<p> <b>" + data.user + ": </b>" + data.message + "</p>";
  }

})

// When the subscriptions.create function is invoked, it will invoke the MessagesChannel#subscribed method, which is in fact a callback method.

// MessagesChannel#subscribed streams from our messages broadcast, sending along any new messages as JSON to the client-side subscription

// The received function is then invoked, with an argument of this new message as JSON.

// The renderMessage function simply appends new messages to the DOM using the $("#messages") jQuery selector.
