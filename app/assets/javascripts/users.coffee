(($) ->
  $("#selectChild").on "click", ->
    userId = $('#inputGroupSelectChild').find(":selected").data('user')
    childId = $('#inputGroupSelectChild').find(":selected").data('child')
    window.location.href = window.location.protocol + '//' + window.location.host + '/users/' + userId + '/children/' + childId

) jQuery
