function update_number_of_unprocessed_message() {
  const elem = $("number_of_unprocessed_messages")
  $.get(elem.data("path"), (data) => {
    if (data === "0") elem.text("")
    else elem.text("(" + data + ")")
  })
    .fail(() => window.location.href = "/login")
}

$(document).ready(() => {
  if ($("#number_of_unprocessed_messages").length)
    window.setInterval(update_number_of_unprocessed_message, 1000 * 30)
})
