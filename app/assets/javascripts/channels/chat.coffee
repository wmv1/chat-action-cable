App.chat = App.cable.subscriptions.create "ChatChannel",
  connected: ->
    # Called when the subscription is ready for use on the server

  disconnected: ->
    # Called when the subscription has been terminated by the server

  received: (data) ->
    $('#messages').append data['message']

  speak: (message, user) ->
    console.log(user)
    @perform 'speak', message: message, user: user


  $(document).on 'keypress', '[data-behavior~=chat_speaker]', (event) ->
    if event.keyCode is 13 # return = send
      user  = document.getElementById("user_id").value
      App.chat.speak event.target.value, user
      event.target.value = ""
      event.preventDefault()
