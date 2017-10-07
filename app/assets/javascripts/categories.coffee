$(document).on 'turbolinks:load', ->
  selectizeCallback = null
  $('.category-modal').on 'hide.bs.modal', (e) ->
    if selectizeCallback != null
      selectizeCallback()
      selectizeCallback = null
    $('#new_category').trigger 'reset'
    $.rails.enableFormElements $('#new_category')
    return
  $('#new_category').on 'submit', (e) ->
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
        $('.category-modal').modal 'toggle'
        return
    return
  $('.category_select').selectize create: (input, callback) ->
    selectizeCallback = callback
    $('.category-modal').modal()
    $('#category_name').val input
    return
  return
