App.room = App.cable.subscriptions.create "RoomChannel",
  connected: ->
    # Called when the subscription is ready for use on the server

  disconnected: ->
    # Called when the subscription has been terminated by the server

  received: (data) ->
    $('#comments').append("<p>" + data['message']+ "<\/p>")

  speak: (message, room_id) ->
    @perform 'speak', {'message': message, "room_id": room_id}

$(document).on 'keypress', '[data-behavior~=room_speaker]', (event) ->
  if event.keyCode is 13 # return = send
    App.room.speak(event.target.value, location.pathname.replace(/\/rooms\//, ""))
    event.target.value = ''
    event.preventDefault()