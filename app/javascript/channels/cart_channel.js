import consumer from "channels/consumer"

consumer.subscriptions.create("CartChannel", {
  connected() {
    // Called when the subscription is ready for use on the server
    console.log("connected and subscribed to candle channel..!");
  },

  disconnected() {
    // Called when the subscription has been terminated by the server
  },

  received(data) {
    // Called when there's incoming data on the websocket for this channel
    $('#cart-count-badge').text(data.total_count);
  }
});
