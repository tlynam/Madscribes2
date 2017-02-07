// Brunch automatically concatenates all files in your
// watched paths. Those paths can be configured at
// config.paths.watched in "brunch-config.js".
//
// However, those files will only be executed if
// explicitly imported. The only exception are files
// in vendor, which are never wrapped in imports and
// therefore are always executed.

// Import dependencies
//
// If you no longer want to use a dependency, remember
// to also remove its path from "config.paths.watched".
import "phoenix_html"

// Import local files
//
// Local files can be imported directly using relative
// paths "./socket" or full ones "web/static/js/socket".

import socket from "./socket"

if (location.pathname === "/") {
  // Now that you are connected, you can join channels with a topic:
  let channel = socket.channel("room:lobby", {})
  let chatInput         = document.querySelector(".chat-input")
  let messagesContainer = document.querySelector(".messages")

  chatInput.addEventListener("keypress", event => {
    if(event.keyCode === 13){
      channel.push("new_msg", {body: chatInput.value})
      chatInput.value = ""
    }
  })

  channel.on("new_msg", payload => {
    let messageItem = document.createElement("li")
    messageItem.innerText = `[${Date()}] ${payload.body}`
    messagesContainer.appendChild(messageItem)
  })

  channel.join()
    .receive("ok", resp => { console.log("Joined successfully", resp) })
    .receive("error", resp => { console.log("Unable to join", resp) })
}

$("nav ul a").each(function(){
  if (location == this.href) {
    $(this).addClass("active")
  }
})
