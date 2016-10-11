// Here is where we definte the client-side instance of our WebSocket Connection

//= require cable
//= require_self
//= require_tree .

this.App = {};

// This is the consumer - the client-side end of our persistent WebSocket connection. We also need to add a subscription to our consumer, telling it to subscribe to the Messages Channel
App.cable = ActionCable.createConsumer();
