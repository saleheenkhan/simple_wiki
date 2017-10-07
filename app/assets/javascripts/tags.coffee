$(document).on 'turbolinks:load', ->
  selectizeCallback = null
  $('.tag-modal').on 'hide.bs.modal', (e) ->
    if selectizeCallback != null
      selectizeCallback()
      selectizeCallback = null
    $('#new_tag').trigger 'reset'
    $.rails.enableFormElements $('#new_tag')
    return
  $('#new_tag').on 'submit', (e) ->
    e.preventDefault()
    $.ajax
      method: 'POST'
      url: $(this).attr('action')
      data: $(this).serialize()
      dataType: 'json'
      success: (response) ->
        selectizeCallback
          value: response.id
          text: response.name
        selectizeCallback = null
        $('.tag-modal').modal 'toggle'
        return
    return
  $('.tag_select').selectize create: (input, callback) ->
    selectizeCallback = callback
    $('.tag-modal').modal()
    $('#tag_name').val input
    return
  return
