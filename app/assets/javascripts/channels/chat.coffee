App.chat = App.cable.subscriptions.create "ChatChannel",
  connected: ->
    console.log("connected ********************************")
    @scroll()
    # Called when the subscription is ready for use on the server

  disconnected: ->
    # Called when the subscription has been terminated by the server

  received: (data) ->
    console.log("*********** "+data.message)
    $('#messages').append data['message']  if @userIsCurrentUser(data.message)
    $('#messages').append data['message'] if  $('meta[name=current-user]').attr('id') == $(data.message).attr('data-from-user-id')
    location.reload() if @userIsCurrentUser(data.message)

  userIsCurrentUser: (message) ->
    console.log("data-from-user-id "+  $(message).attr('data-from-user-id'))
    console.log("data-user-id "+  $(message).attr('data-user-id'))
    console.log("name=current-user "+$('meta[name=current-user]').attr('id'))
    $(message).attr('data-user-id') == $('meta[name=current-user]').attr('id') && $(message).attr('data-from-user-id') == $('div[name=data-chat-room-user-id]').attr('id')


  speak: (message, user) ->
    console.log(user)
    @perform 'speak', message: message, user: user

  falar: (message, user) ->
    console.log(user)
    @perform 'falar', message: message, user: user


  scroll: () ->
    area = document.getElementById("messages");
    area.scrollIntoView({block: "end"})

  $(document).on 'keypress', '[data-behavior~=chat_speaker]', (event) ->
    if event.keyCode is 13 # return = send
      user  = document.getElementById("secondary_user_id").value
      App.chat.speak event.target.value, user
      event.target.value = ""
      event.preventDefault()
